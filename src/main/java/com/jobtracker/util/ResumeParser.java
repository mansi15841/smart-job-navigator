package com.jobtracker.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.pdfbox.Loader;

public class ResumeParser {

	public static String extractText(String filePath) {
	    try {
	        File file = new File(filePath);
	        PDDocument document = Loader.loadPDF(file);
	        PDFTextStripper stripper = new PDFTextStripper();
	        String text = stripper.getText(document);
	        document.close();
	        return text.toLowerCase();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "";
	}

    public static List<String> detectSkills(String text) {

        List<String> skills = new ArrayList<>();

        if(text.contains("java")) skills.add("Java");
        if(text.contains("python")) skills.add("Python");
        if(text.contains("sql")) skills.add("SQL");
        if(text.contains("html")) skills.add("HTML");
        if(text.contains("css")) skills.add("CSS");
        if(text.contains("javascript")) skills.add("JavaScript");
        if(text.contains("spring")) skills.add("Spring");
        if(text.contains("jdbc")) skills.add("JDBC");

        return skills;
    }

    public static int calculateScore(List<String> skills) {
        return skills.size() * 10;
    }

    public static String suggestRole(String text) {

        if(text.contains("java") && text.contains("spring"))
            return "Java Developer";

        if(text.contains("python") && text.contains("machine learning"))
            return "Machine Learning Engineer";

        if(text.contains("html") && text.contains("css"))
            return "Frontend Developer";

        return "Software Developer";
    }

    public static List<String> skillGap(List<String> skills) {

        List<String> missing = new ArrayList<>();

        if(!skills.contains("Spring"))
            missing.add("Spring Framework");

        if(!skills.contains("SQL"))
            missing.add("Database Skills");

        if(!skills.contains("JavaScript"))
            missing.add("Frontend Skills");

        return missing;
    }
}