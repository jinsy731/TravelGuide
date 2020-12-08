package jsp.util;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Crawler {
    public void crawling() {
        try {
            String url = "https://search.naver.com/search.naver?where=image&sm=tab_jum&query=%EC%82%BC%EC%B2%99%ED%95%B4%EC%88%98%EC%9A%95%EC%9E%A5";
            Connection conn = Jsoup.connect(url);

            Document html = conn.get();

            System.out.println(html.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
