package au.gov.nla.khn.alexandria.model;

/**
 * @author K.H.Nguyen
 * 
 */
public class Book {

	private final String title, author;
	private final long isbn;

	public Book(String title, String author, long isbn) {
		this.title = title;
		this.author = author;
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public String getAuthor() {
		return author;
	}

	public long getIsbn() {
		return isbn;
	}

}
