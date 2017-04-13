package util;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.ValueFilter;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 将数据转成json数据格式
 * @author zyf
 *
 */
public class AddJson extends ActionSupport{
	
	private static final long serialVersionUID = 1L;

	private static ValueFilter filter = new ValueFilter() {
        @Override
        public Object process(Object obj, String s, Object v) {
            if (v == null)
                return "";
            return v;
        }
    };
	public void toJson(Object str) throws IOException{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setHeader("Cache-Control", "no-cache");  
		response.setHeader("Pragma", "no-cache");  
		response.setDateHeader("Expires", 0);  
		response.setContentType("text/html;charset=utf-8");
		
		String responseStr = JSON.toJSONString(str,filter,SerializerFeature.WriteNullStringAsEmpty);
		Writer writer = response.getWriter();
		writer.write(responseStr);
		writer.flush();
	}
}
