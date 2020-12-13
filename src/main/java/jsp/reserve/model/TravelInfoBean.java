package jsp.reserve.model;

public class TravelInfoBean {
    String tdName = null;
    String tdDist = null;
    String tdRAddr = null;
    String tdNAddr  = null;
    Double tdLatitude = null;
    Double tdLongitude = null;
    Double tdArea = null ;
    String tdCnvFclty  = null;
    String tdStayInfo  = null;
    String tdExFclty   = null;
    String tdRcrFclty  = null;
    String tdsuprtFclty  = null;
    String tdDescription = null;

    public void setTdArea(Double tdArea) {
        this.tdArea = tdArea;
    }

    public void setTdCnvFclty(String tdCnvFclty) {
        this.tdCnvFclty = tdCnvFclty;
    }

    public void setTdDescription(String tdDescription) {
        this.tdDescription = tdDescription;
    }

    public void setTdDist(String tdDist) {
        this.tdDist = tdDist;
    }

    public void setTdExFclty(String tdExFclty) {
        this.tdExFclty = tdExFclty;
    }

    public void setTdLatitude(Double tdLatitude) {
        this.tdLatitude = tdLatitude;
    }

    public void setTdLongitude(Double tdLongitude) {
        this.tdLongitude = tdLongitude;
    }

    public void setTdNAddr(String tdNAddr) {
        this.tdNAddr = tdNAddr;
    }

    public void setTdName(String tdName) {
        this.tdName = tdName;
    }

    public void setTdRAddr(String tdRAddr) {
        this.tdRAddr = tdRAddr;
    }

    public void setTdRcrFclty(String tdRcrFclty) {
        this.tdRcrFclty = tdRcrFclty;
    }

    public void setTdStayInfo(String tdStayInfo) {
        this.tdStayInfo = tdStayInfo;
    }

    public void setTdsuprtFclty(String tdsuprtFclty) {
        this.tdsuprtFclty = tdsuprtFclty;
    }

    public Double getTdLatitude() {
        return tdLatitude;
    }

    public Double getTdLongitude() {
        return tdLongitude;
    }

    public Double getTdArea() {
        return tdArea;
    }

    public String getTdCnvFclty() {
        return tdCnvFclty;
    }

    public String getTdDescription() {
        return tdDescription;
    }

    public String getTdDist() {
        return tdDist;
    }

    public String getTdExFclty() {
        return tdExFclty;
    }

    public String getTdNAddr() {
        return tdNAddr;
    }

    public String getTdName() {
        return tdName;
    }

    public String getTdRAddr() {
        return tdRAddr;
    }

    public String getTdRcrFclty() {
        return tdRcrFclty;
    }

    public String getTdStayInfo() {
        return tdStayInfo;
    }

    public String getTdsuprtFclty() {
        return tdsuprtFclty;
    }
}
