public class SierpinskiTriangle extends JFrame {
    public static int OFFSET = 25; // pixel offset from edge
    
    private static int depth; // recursion depth
    
    /** Constructor: an instance */
    public SierpinskiTriangle() {
        super("Sierpinski triangle");
        Container cont= getContentPane();
        setSize(400, 400);
        setVisible(true);
    }
    
    public @Override void paint(Graphics g) {
        // Clear the frame
        g.setColor(Color.white);
        g.fillRect(0, 0, getWidth(), getHeight());
        g.setColor(Color.black);
        
        // Initialize p1, p2, p3 based on frame size */
        Point p1 = new Point(getWidth() / 2, OFFSET);
        Point p2 = new Point(OFFSET, getHeight() - OFFSET);
        Point p3 = new Point(getWidth() - OFFSET, getHeight() - OFFSET);            
        
        // Draw Sierpinski's triangle
        drawTriangles(g, depth, p1, p2, p3);
    }
    
    /** Draw a line between p1 and p2 on g. */
    private static void drawLine(Graphics g, Point p1, Point p2) {
        g.drawLine(p1.x, p1.y, p2.x, p2.y);
    }
    
    /** = the midpoint between p1 and p2 */
    private static Point midpoint(Point p1, Point p2) {
        return new Point((p1.x + p2.x) / 2, (p1.y + p2.y) / 2);
    }
    
    /** Draw a Sierpinski triangle of depth d with perimeter
      * given by p1, p2, p3.
      p1-p2 is the base line, p3 the top point*/
    private static void drawTriangles(Graphics g, int d, Point p1, Point p2, Point p3) {
        if (d == 0) {  // depth is 0, draw the triangle
            drawLine(g, p1, p2);
            drawLine(g, p2, p3);
            drawLine(g, p3, p1);
            return;
        }
        // Draw three Sierpinski triangles of depth d-1
        Point m12= midpoint(p1,p2);
        Point m23= midpoint(p2,p3);
        Point m31= midpoint(p3,p1);
        drawTriangles(g, d - 1, p1, m12, m31);
        drawTriangles(g, d - 1, m12, p2, m23);
        drawTriangles(g, d - 1, m31, m23, p3);
    }
    
    /** Draw a Sierpinski triangle of depth d.
      * Precondition: d >= 0. */
    public void Sierpinski(int d) {
        depth= d; repaint();
    }
}
