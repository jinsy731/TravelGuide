package jsp.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class ChangeDateFormat {

    public String converseDateFormat(String date, String fromFormatString, String toFormatString) {
        SimpleDateFormat fromFormat = new SimpleDateFormat(fromFormatString);
        SimpleDateFormat toFormat = new SimpleDateFormat(toFormatString);
        Date fromDate = null;

        try {
            fromDate = fromFormat.parse(date);
        }
        catch (ParseException e) {
            fromDate = new Date();
        }

        return toFormat.format(fromDate);
    }

    public String converseDateFormat(Date date, String format) {
        SimpleDateFormat toFormat = new SimpleDateFormat(format);
        return toFormat.format(date);
    }
}
