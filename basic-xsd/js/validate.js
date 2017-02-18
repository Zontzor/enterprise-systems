// Load XML file...
var doc = new ActiveXObject("MSXML2.DOMDocument.6.0");
doc.async = false;
doc.validateOnParse=true;
doc.load("notes_with_reference.xml");

/// Load Schema file...
var nameSpace = doc.documentElement.namespaceURI;
var xmlSchema = new ActiveXObject("MSXML2.XMLSchemaCache.6.0");
xmlSchema.add(nameSpace,"note.xsd");
doc.schemas = xmlSchema;

// Parse/Validate XML file...
doc.load("notes_with_reference.xml");
var error = doc.parseError;
if (error != "") {
alert(error.reason);
}

// Write HTML output...
document.write("XML Root Tag Name: " + doc.documentElement.tagName + "<br/><br/>");
//Use the following…
//rootChildren = doc.documentElement.childNodes
//rootChildren[i].firstChild.nodeValue