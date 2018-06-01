package com.polyservice.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentCatalog;
import org.apache.pdfbox.pdmodel.interactive.form.PDAcroForm;
import org.apache.pdfbox.pdmodel.interactive.form.PDField;
import org.apache.pdfbox.text.PDFTextStripper;

public class test {
	
	private static PDDocument _pdfDocument;

	public static void main(String args[]) throws IOException {
		
		String originalPdf = "pdf_resources/segment_1_registration_form_1.3.pdf";
		String targetPdf = "pdf_resources/segment_1_registration_form_1.3COPY.pdf";
		
		File file = new File(originalPdf);
		PDDocument document = PDDocument.load(file); 
		
		
		//Read PDF content
		PDFTextStripper pdfStripper = new PDFTextStripper();
		String text = pdfStripper.getText(document);
		System.out.println(text);
		
		//Fill PDF form
        PDDocumentCatalog docCatalog = document.getDocumentCatalog();
        PDAcroForm acroForm = docCatalog.getAcroForm();
        PDField field = acroForm.getField("Time");
        field.setValue("2");
		
        File saveFile = new File(targetPdf);
        document.save(saveFile);
        
		document.close();
	
		
		
		
		
	}
	
	
	
	

}
