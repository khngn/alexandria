package au.gov.nla.khn.alexandria.model;

/**
 * @author K.H.Nguyen
 * 
 */
public class Book {

	private final int id;
	private final String title, author;
	private final long isbn;

	public Book(int id, String title, String author, long isbn) {
		this.id = id;
		this.title = title;
		this.author = author;
		this.isbn = isbn;
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

	public long getIsbn() {
		return isbn;
	}

}
