package jsp.reserve.action;

import jsp.reserve.model.TravelInfoBean;
import jsp.util.Action;
import jsp.util.ActionForward;

import jsp.util.DBConnection;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;


public class APIParsingAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {



        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        // XML 문서 파싱
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = factory.newDocumentBuilder();
        Document document = documentBuilder.parse("C:\\Users\\jinsy\\IdeaProjects\\TravelGuide\\src\\TravelInfo.xml");

        // root 구하기
        Element root = document.getDocumentElement();
        NodeList record = root.getChildNodes().item(1).getChildNodes();


        String resultString ="";
        ArrayList<TravelInfoBean> beanList = new ArrayList<TravelInfoBean>();

        for(int i=0; i < record.getLength(); i++) {
            NodeList itemList = record.item(i).getChildNodes();
            TravelInfoBean bean = new TravelInfoBean();

            for(int j=0; j < itemList.getLength(); j++) {
                Node item = itemList.item(j);
                String result = "";
                if(item.getTextContent() == "") {
                    if((j >= 4 && j <= 6)) {
                        break;
                    }
                    result = "null";
                }
                else result = item.getTextContent();

                resultString += item.getNodeName();
                resultString += ":" + result + "<br>";

                switch (j) {
                    case 0 :
                        bean.setTdName(result);
                        break;
                    case 1:
                        bean.setTdDist(result);
                        break;
                    case 2:
                        bean.setTdRAddr(result);
                        break;
                    case 3:
                        bean.setTdNAddr(result);
                        break;
                    case 4 :
                        bean.setTdLatitude(Double.parseDouble(result));
                        break;
                    case 5 :
                        bean.setTdLongitude(Double.parseDouble(result));
                        break;
                    case 6:
                        bean.setTdArea(Double.parseDouble(result));
                        break;
                    case 7 :
                        bean.setTdCnvFclty(result);
                        break;
                    case 8 :
                        bean.setTdStayInfo(result);
                        break;
                    case 9 :
                        bean.setTdExFclty(result);
                        break;
                    case 10 :
                        bean.setTdRcrFclty(result);
                        break;
                    case 12 :
                        bean.setTdsuprtFclty(result);
                        break;
                    case 16 :
                        bean.setTdDescription(result);
                        break;
                    default:
                }
                if(j == itemList.getLength() - 1)
                    beanList.add(bean);
            }

        }

        response.getWriter().print(resultString);

        Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = null;

        try {
            String sql = "insert into travel_info values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);

            for(TravelInfoBean bean : beanList) {
                System.out.println(bean);
                pstmt.setString(1, bean.getTdName());
                pstmt.setString(2, bean.getTdDist());
                pstmt.setString(3, bean.getTdRAddr());
                pstmt.setString(4, bean.getTdNAddr());
                pstmt.setDouble(5, bean.getTdLatitude());
                pstmt.setDouble(6, bean.getTdLongitude());
                pstmt.setDouble(7, bean.getTdArea());
                pstmt.setString(8, bean.getTdCnvFclty());
                pstmt.setString(9, bean.getTdStayInfo());
                pstmt.setString(10, bean.getTdExFclty());
                pstmt.setString(11, bean.getTdRcrFclty());
                pstmt.setString(12, bean.getTdsuprtFclty());
                pstmt.setString(13, bean.getTdDescription());

                pstmt.executeUpdate();
            }
        }
        catch(SQLException e) {
            e.printStackTrace();
        }










        return null;
    }
}
