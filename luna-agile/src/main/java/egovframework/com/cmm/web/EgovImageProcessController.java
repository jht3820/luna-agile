package egovframework.com.cmm.web;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;



@SuppressWarnings("serial")
@Controller
public class EgovImageProcessController extends HttpServlet {
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;

    
    @RequestMapping("/cmm/fms/getImage.do")
    public void getImageInf(SessionVO sessionVO, ModelMap model, @RequestParam Map<String, Object> commandMap, HttpServletResponse response,HttpServletRequest request) throws Exception {


		String atchFileId = (String)commandMap.get("atchFileId");
		String fileSn = (String)commandMap.get("fileSn");
		
		FileVO vo = new FileVO();

		vo.setAtchFileId(atchFileId);
		vo.setFileSn(fileSn);

		if (fileSn == null || fileSn.equals("")) {
			int newMaxFileSN = fileService.getMaxFileSN(vo);
			vo.setFileSn(Integer.toString(newMaxFileSN - 1));
		}
		

		FileVO fvo = fileService.selectFileInf(vo);


		File file = null;
		FileInputStream fis = null;

		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;
		
		try {
			
			if(fvo == null) {
				throw new Exception("이미지 검색 결과 없음");
			}
		
		    file = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
		    fis = new FileInputStream(file);

		    in = new BufferedInputStream(fis);
		    bStream = new ByteArrayOutputStream();

		    int imgByte;
		    while ((imgByte = in.read()) != -1) {
		    	bStream.write(imgByte);
		    }

			String type = "";

			if (fvo.getFileExtsn() != null && !"".equals(fvo.getFileExtsn())) {
			    if ("jpg".equals(fvo.getFileExtsn().toLowerCase())) {
				type = "image/jpeg";
			    } else {
			    	type = "image/" + fvo.getFileExtsn().toLowerCase();
			    }
			    type = "image/" + fvo.getFileExtsn().toLowerCase();

			} else {
				Log.debug("Image fileType is null.");
			}

			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());

			bStream.writeTo(response.getOutputStream());

			response.getOutputStream().flush();
			response.getOutputStream().close();
			
			
			in.close();
			bStream.close();
			fis.close();
			
		}catch(Exception e){
			try{
				
				response.setContentType("image/jpeg");
				String pathToWeb = request.getSession().getServletContext().getRealPath("/");
				File f = new File(pathToWeb + "/media/users/default.jpg");
				BufferedImage bi = ImageIO.read(f);
				OutputStream out = response.getOutputStream();
				ImageIO.write(bi, "jpg", out);
				out.close();
				
			}catch(Exception ee){
				
				response.setHeader("Content-Type", "image/jpeg");
				response.setContentLength(0);
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
		}
    }
}
