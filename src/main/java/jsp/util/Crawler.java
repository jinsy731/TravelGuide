package jsp.util;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
    public void crawling() {
        try {
            String url = "https://korean.visitseoul.net/attractions";
            Connection conn = Jsoup.connect(url);

            Document html = conn.get();
            Elements item = html.getElementsByClass("item");

            System.out.println(item.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
