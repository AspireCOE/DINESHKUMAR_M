class Shape {
    protected String color;

    public Shape(String color) {
        this.color = color;
    }

    public void getColor() {
        System.out.println("Color: " + color);
    }
}

class Circle extends Shape {
    private double radius;

    public Circle(String color, double radius) {
        super(color);
        this.radius = radius;
    }

    public double getArea() {
        return Math.PI * radius * radius;
    }
}

class Rectangle extends Shape {
    private double width;
    private double height;

    public Rectangle(String color, double width, double height) {
        super(color);
        this.width = width;
        this.height = height;
    }

    public double getArea() {
        return width * height;
    }
}

public class Heirarchial_inheritance  {
    public static void main(String[] args) {
        Circle redCircle = new Circle("red", 5);
        Rectangle blueRectangle = new Rectangle("blue", 4, 6);

        redCircle.getColor(); 
        System.out.println("Area of Circle: " + redCircle.getArea()); 

        blueRectangle.getColor(); 
        System.out.println("Area of Rectangle: " + blueRectangle.getArea()); 
    }
}




