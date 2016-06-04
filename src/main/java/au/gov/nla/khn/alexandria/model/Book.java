package au.gov.nla.khn.alexandria.model;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

/**
 * @author K.H.Nguyen
 * 
 */
public class Book {

	private final int id;
	private final String title, author;
	private final long isbn;
	private final String summary;
	private final String coverSrc;

	/**
	 * @param id
	 * @param title
	 * @param author
	 * @param isbn
	 */
	public Book(int id, String title, String author, long isbn) {
		this.id = id;
		this.title = title;
		this.author = author;
		this.isbn = isbn;
		
		// get some random filler text
		this.summary = FILLERS.get(new Random().nextInt(FILLERS.size()));

		String coverFileName = this.title.toLowerCase().replaceAll(" ", "-");
		this.coverSrc = "resources/img/book/" + coverFileName + ".jpg";
	}
	
	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getAuthor() {
		return author;
	}

	public String getIsbn() {
		return String.format("%,16d%n", isbn).replaceAll(",", "-");
	}

	public String getCoverSrc() {
		return coverSrc;
	}
	
	private static final List<String> FILLERS = Collections.unmodifiableList(getFillerText());
	
	public String getSummary() {
		return summary;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", title=" + title + ", author=" + author + ", isbn=" + isbn + "]";
	}
	
	private static List<String> getFillerText() {
		try {
			Path path = Paths.get(Book.class.getResource("lorem-ipsum.txt").toURI());
			return Files.readAllLines(path, StandardCharsets.UTF_8);
		} catch (URISyntaxException | IOException e) {
			// can't happen
			e.printStackTrace();
			return Arrays.asList("Not available");
		}
	}
}
