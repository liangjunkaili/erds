/*package erds.com.util.qrcode;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.imageio.ImageIO;

import com.swetake.util.Qrcode;

import jp.sourceforge.qrcode.QRCodeDecoder;

public class QRCodeUtil {

	public static void main(String[] args){
		try {
			createQRcode();
//			readQRcode();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void createQRcode() throws IOException{
		Qrcode x = new Qrcode();
		x.setQrcodeErrorCorrect('M');
		x.setQrcodeEncodeMode('B');
		x.setQrcodeVersion(7);
		String qrData = "http://www.magicabc.com.cn/home.jsp";
		
		int width = 67+12*(7-1);
		int height = 67+12*(7-1);
		BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D gs = bufferedImage.createGraphics();
		gs.setBackground(Color.WHITE);
		gs.setColor(Color.BLACK);
		int pixoff = 2;//偏移量
		gs.clearRect(0, 0, width, height);
		byte[] d = qrData.getBytes("gb2312");
		if(d.length>0 && d.length<120){
			boolean[][] s = x.calQrcode(d);
			for(int i=0;i<s.length;i++){
				for(int j=0;j<s.length;j++){
					if(s[j][i]){
						gs.fillRect(j*3+pixoff, i*3+pixoff, 3, 3);
					}
				}
			}
		}
		gs.dispose();
		bufferedImage.flush();
		ImageIO.write(bufferedImage, "png", new File("D:/code/qrcode.png"));
	}
	
	public static void readQRcode() throws Exception, UnsupportedEncodingException{
		File file = new File("D:/code/qrcode.png");
		BufferedImage bufferedImage = ImageIO.read(file);
		QRCodeDecoder codeDecoder = new QRCodeDecoder();
//		String result = new String(codeDecoder.decode(new MyQrcodeImage(bufferedImage)),"gb2312");
//		System.out.println(result);
	}
}
*/