package erds.com.util;

import java.io.File;
import java.io.IOException;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class JxlUtil {

	public static void main(String[] args) {
//		writeExcel();
		readExcel();
	}
	public static void writeExcel(){
		String[] title = {"id","name","sex"};
		File file = new File("e:/jxl_test.xls");
		try {
			file.createNewFile();
			WritableWorkbook workbook = Workbook.createWorkbook(file);
			WritableSheet sheet = workbook.createSheet("sheet1", 0);
			Label label = null;
			for(int i=0;i<title.length;i++){
				label = new Label(i,0,title[i]);
				sheet.addCell(label);
			}
			for (int i = 1; i < 10; i++) {
				label = new Label(0,i,"a"+1);
				sheet.addCell(label);
				label = new Label(1,i,"user"+1);
				sheet.addCell(label);
				label = new Label(2,i,"男"+1);
				sheet.addCell(label);
			}
			workbook.write();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	public static void readExcel(){
		try {
			Workbook workbook = Workbook.getWorkbook(new File("e:/jxl_test.xls"));
			Sheet sheet = workbook.getSheet(0);
			for (int i = 0; i < sheet.getRows(); i++) {
				for (int j = 0; j < sheet.getColumns(); j++) {
					Cell cell = sheet.getCell(j, i);
					System.out.println(cell.getContents());
				}
				System.out.println();
			}
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
}
