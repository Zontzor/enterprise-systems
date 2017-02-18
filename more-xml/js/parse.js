text = "<ORDER>"+
"<PERSON>John Smith</PERSON>"+
"<SHIPTO>"+
"<NAME>Ola Nordmann</NAME>"+
"<ADDRESS>Langgt 23</ADDRESS>"+
"<CITY>400 Stavanager</CITY>"+
"<COUNTRY>Norway</COUNTRY>"+
"</SHIPTO>"+
"<ITEM>"+
"<NAME>Item 1</NAME>"+
"<TITLE>Empire Burlesque</TITLE>"+
"<ID>001</ID>"+
"<NOTE>Special Edition</NOTE>"+
"<QUANTITY>1</QUANTITY>"+
"<PRICE>10.90</PRICE>"+
"</ITEM>"+
"<ITEM>"+
"<NAME>Item 2</NAME>"+
"<TITLE>Hide Your Heart</TITLE>"+
"<ID>002</ID>"+
"<QUANTITY>2</QUANTITY>"+
"<PRICE>9.90</PRICE>"+
"</ITEM>"+
"<ORDERTOTAL></ORDERTOTAL>"+
"</ORDER>";

parser = new DOMParser();
xmlDoc = parser.parseFromString(text,"text/xml");

// Write HTML output
document.write("<b>XML Root Tag Name: " + xmlDoc.documentElement.nodeName + "</b><br/><br/><br/>");

var rootChildren = xmlDoc.documentElement.childNodes;
var orderTotal = 0;

for (i = 0; i < rootChildren.length; i++) {
  if (rootChildren[i].children.length != 0) {
    document.write(rootChildren[i].nodeName + ":<br>" );
    traverse(rootChildren[i].childNodes);
  } else {
    if (rootChildren[i].nodeName == "ORDERTOTAL") {
      rootChildren[i].textContent = orderTotal;
    }
    document.write(rootChildren[i].nodeName + ": " + rootChildren[i].textContent + "<br>");
  }
}

function traverse(tree) {
  for (j = 0; j < tree.length; j++) {
    document.write("&nbsp&nbsp" + tree[j].nodeName + ": " + tree[j].textContent + "<br>");
    if (tree[j].nodeName == "PRICE") {
      orderTotal += parseFloat(tree[j].textContent);
    }
  }
}