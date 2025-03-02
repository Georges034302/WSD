package uts.geometry;

import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Circle implements Serializable{
    private double radius;

    public Circle() {
        super();
    }

    public Circle(double radius) {
        super();
        this.radius = radius;
    }

    @XmlElement
    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }
    
    @XmlElement
    public double getPerimeter(){
        return 2*Math.PI*radius;
    }
    
    @XmlElement
    public double getArea(){
        return Math.PI*Math.pow(radius, 2);
    }
}
