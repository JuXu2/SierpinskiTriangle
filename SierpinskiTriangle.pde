public class Sierpinski {

    public static void sierpinski(int n) {
        sierpinski(n, 0, 0, 1);
    }

    public static void sierpinski(int n, double x, double y, double size) {

        if (n == 0) return;

        //compute triangle points
        double x0 = x;
        double y0 = y;
        double x1 = x0 + size;
        double y1 = y0;
        double x2 = x0 + size / 2;
        double y2 = y0 + (Math.sqrt(3)) * size / 2;

        // draw the triangle        
        StdDraw.line(x0, y0, x1, y1);
        StdDraw.line(x0, y0, x2, y2);
        StdDraw.line(x1, y1, x2, y2);
        StdDraw.show(100);

        //recursive calls
        sierpinski(n-1, x0, y0, size / 2);
        sierpinski(n-1, (x0 + x1) / 2, (y0 + y1) / 2, size / 2);
        sierpinski(n-1, (x0 + x2) / 2, (y0 + y2) / 2, size / 2);
    }

    // read in a command-line argument n and plot an order Sierpinski Triangle
    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        StdDraw.setPenRadius(0.005);
        sierpinski(n);
    }
}
