##Instant Search Tutorial

*Based on : https://www.algolia.com/doc/tutorials/ios-instant-search#UI

##Setup Instructions
1. In Constants_SETUP.swift -> Enter in your API ID and Key from the "Credentials" section in Algolia Search in the then rename this file to Constants.swift in Xcode
2. In Movielist.json: upload the attached movielist.json file to your Algolia account and make sure you have created a new index calledd "tutorial"
3. Delete Constants_SETUP.swift

3b. (Optionally if you want to use the data set that comes with the Algolia tutorial - then switch the feature branch: feature/Option2_UpdateToActorsDataSet)
3c Go through their tutorial to get started which creates a gettingstarted_actors index ( no idea about link)
3d. Update the index in the AlgoliaIndexConstants.swift to the correct index where you have stored that data if its changed since this project has been created.  You can find it by going to "Indices"in the Dashboard backend for Algolia.

###Tech Investigation into algolia
I am currently looking at Search providers to integrate into apps, so this is the tutorial from their site
for others who are interested in kicking the tyres on it, quite quickly. m

###Notes and Feedback on the Tutorial

- the initial import tutorial to create th index doesnt seem to work. it links to a page where whn you run through the tutorial it creates an index called getstarted_actors but the tutorial refers to movies. 
- Recommend that they add the link to Github for the resulting code at top of Demo
- Tutorial needs to be updated to include the Search Bar/ Search Display controller in latest Xcode eg : https://github.com/algolia/algolia-swift-demo
- Pod for algolia search client in the tutorial seems to be erroring - recommend update to the latest: pod 'AlgoliaSearch-Client-Swift', '~> 2.0' in the tutorial which builds ok. 
- The Algolia Methods are difficult to identify - it would be a nice touch to add Algolia or AS before the method to aid readability of the code
- using the same name of the object as the object type can make the tutorial look quite complex.  Preferably use a variant on the object type . eg instead of var query = Query() use: var myQuery = Query() to distinguish and reduce the risk of errors

###UI within Algolia Platform
- Not very clear where to locate API Key and Secret.  It should be a lot clearer to make it easier to find. eg under "app" would be the most logical place to find it.
- If a user has already created an application -there is no easy way to create a new application to do the tutorial or even delete and reset their account. If they try- then they are threatened with having their credit card immediately charged. ( not very friendly and usable for developers learning to use the platform)
- After a bit of help from Support- it turns out that you need to add a a new index to the existing application - instead of adding a new application llike other developer services do like Parse.com and Flickr.  It might be a good idea to feed that back to users on a relevant page like the "created new application page"
- They also can't easily find a link to contact support. Its very well hidden! - Should be much easier to see support to encourage people engage and evangelise. 
- If user puts an incorrect Index in - then it should give a useful feedback message. ( nothing came up when I deliberately put in the wrong one)