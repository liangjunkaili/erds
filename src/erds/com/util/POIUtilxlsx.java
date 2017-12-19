package erds.com.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class POIUtilxlsx {
	public static void main(String[] args) {
//		writePOI();
		readPOI();
	}
	//xlsx
		public static void writePOI(){
			String[] title = {"id","name","sex"};
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = workbook.createSheet();
			XSSFRow row = sheet.createRow(0);
			XSSFCell cell = null;
			for (int i = 0; i < title.length; i++) {
				cell = row.createCell(i);
				cell.setCellValue(title[i]);
			}
			for (int i = 1; i <= 10; i++) {
				XSSFRow nextRow = sheet.createRow(i);
				XSSFCell cell2 = nextRow.createCell(0);
				cell2.setCellValue("a"+i);
				cell2 = nextRow.createCell(1);
				cell2.setCellValue("user"+i);
				cell2 = nextRow.createCell(2);
				cell2.setCellValue("男");
			}
			File file = new File("e:/poi_test.xlsx");
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
		File file = new File("e:/poi_test.xlsx");
		try {
			XSSFWorkbook workbook = new XSSFWorkbook(FileUtils.openInputStream(file));
//			HSSFSheet sheet = workbook.getSheet("sheet0");
			XSSFSheet sheet = workbook.getSheetAt(0);
			int firstRowNum = 0;
			int lastRowNum = sheet.getLastRowNum();
			for (int i = 0; i <= lastRowNum; i++) {
				XSSFRow row = sheet.getRow(i);
				int lastCellNum = row.getLastCellNum();
				for (int j = 0; j < lastCellNum; j++) {
					XSSFCell cell = row.getCell(j);
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
