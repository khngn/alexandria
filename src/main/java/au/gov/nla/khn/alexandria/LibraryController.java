/**
 * 
 */
package au.gov.nla.khn.alexandria;

import java.util.List;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import au.gov.nla.khn.alexandria.model.Book;
import au.gov.nla.khn.alexandria.model.Person;
import au.gov.nla.khn.alexandria.service.BookService;
import au.gov.nla.khn.alexandria.service.PersonService;

/**
 * @author K.H.Nguyen
 * 
 */
@Controller
public class LibraryController {

	private static final Logger LOGGER = LoggerFactory.getLogger(LibraryController.class);

	@Autowired
	private LibraryServices services;
	
	private PersonService personService;
	private BookService bookService;
	
	@PostConstruct
	private void init() {
		personService = services.getService(PersonService.class);
		bookService = services.getService(BookService.class);
	}

	/**
	 * Query all persons and books
	 * 
	 * @param model
	 * @return the index view name (FTL)
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(@ModelAttribute("model") ModelMap model) {
		LOGGER.debug("@RequestMapping /index");
		// find all Persons
		List<Person> persons = personService.findAll();
		model.addAttribute("persons", persons);

		// find all Books
		List<Book> books = bookService.findAll();
		model.addAttribute("books", books);

		return "index";
	}

	@RequestMapping(value = "/api/findBooksByPersonId", method = RequestMethod.POST)
	@ResponseBody
	public List<Book> findBooksByPersonId(@RequestBody String personId) {
		LOGGER.debug("findBooksByPersonId({})", personId);
		List<Book> books = personService.findBooksOf(Integer.valueOf(personId));
		return books;
	}

	/**
	 * Add a new Person
	 * 
	 * @param person
	 * @return redirect to /index page to display the new list
	 */
	@RequestMapping(value = "/addPerson", method = RequestMethod.POST)
	public String add(@ModelAttribute("person") Person person) {
		LOGGER.debug("add({})", person);
		if (person != null && person.isValid()) {
			personService.add(person.getName(), person.getPhoneNumber(), person.getEmail());
		}

		return "redirect:index";
	}

}
