/**
 * 
 */
package au.gov.nla.khn.alexandria;

import au.gov.nla.khn.alexandria.service.LibraryService;

/**
 * @author K.H.Nguyen
 *
 */
public interface LibraryServiceLookup {

	<T extends LibraryService> T getService(Class<T> serviceType);
	
}
