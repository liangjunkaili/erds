/*package erds.com.util.qrcode;

import java.awt.image.BufferedImage;
import java.io.File;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

*//**
 * 通过zxing生成二维码
 * @author admin
 *
 *//*
public class ZxingUtil {

	public static void main(String[] args){
		//createQRCode();
		readQRCode();
	}
	
	public static void createQRCode(){
		int width = 300;
		int height = 300;
		String format = "png";
		String content = "5s-edu.com";
		//定义二维码参数
		Map hints = new HashMap<>();
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
		hints.put(EncodeHintType.MARGIN, 2);
		
		try {
			BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, width, height,hints);
			Path file = new File("D:/code/img.png").toPath();
			MatrixToImageWriter.writeToPath(bitMatrix, format, file);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void readQRCode(){
		try {
			MultiFormatReader formatReader = new MultiFormatReader();
			File file = new File("D:/code/img.png");
			BufferedImage image = ImageIO.read(file);
			BinaryBitmap binaryBitmap = new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(image)));
			//定义二维码参数
			Map hints = new HashMap<>();
			hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
			hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
			hints.put(EncodeHintType.MARGIN, 2);
			Result result = formatReader.decode(binaryBitmap, hints);
			
			System.out.println(result.toString());
			System.out.println(result.getBarcodeFormat());
			System.out.println(result.getText());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
*/