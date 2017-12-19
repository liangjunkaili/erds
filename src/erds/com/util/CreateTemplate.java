package erds.com.util;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

public class CreateTemplate {

	public static void main(String[] args) {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("sheet1");
		int rownum=0;
		int column=0;
		sheet.setColumnWidth(column, 11);
		HSSFRow row = sheet.createRow(rownum);
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 0));
	}
}
