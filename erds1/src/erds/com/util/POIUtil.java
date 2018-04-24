package erds.com.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class POIUtil {
	public static void main(String[] args) {
//		writePOI();
		readPOI();
	}
	//xls
	public static void writePOI(){
		String[] title = {"id","name","sex"};
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet();
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = null;
		for (int i = 0; i < title.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(title[i]);
		}
		for (int i = 1; i <= 10; i++) {
			HSSFRow nextRow = sheet.createRow(i);
			HSSFCell cell2 = nextRow.createCell(0);
			cell2.setCellValue("a"+i);
			cell2 = nextRow.createCell(1);
			cell2.setCellValue("user"+i);
			cell2 = nextRow.createCell(2);
			cell2.setCellValue("男");
		}
		File file = new File("e:/poi_test.xls");
		try {
			file.createNewFile();
			FileOutputStream stream = FileUtils.openOutputStream(file);
			workbook.write(stream);
			stream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static void readPOI(){
		File file = new File("e:/poi_test.xls");
		try {
			HSSFWorkbook workbook = new HSSFWorkbook(FileUtils.openInputStream(file));
//			HSSFSheet sheet = workbook.getSheet("sheet0");
			HSSFSheet sheet = workbook.getSheetAt(0);
			int firstRowNum = 0;
			int lastRowNum = sheet.getLastRowNum();
			for (int i = 0; i <= lastRowNum; i++) {
				HSSFRow row = sheet.getRow(i);
				int lastCellNum = row.getLastCellNum();
				for (int j = 0; j < lastCellNum; j++) {
					HSSFCell cell = row.getCell(j);
					String value = cell.getStringCellValue();
					System.out.print(value+"  ");
				}
				System.out.println();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
