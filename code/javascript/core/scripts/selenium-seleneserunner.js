/*
* Copyright 2005 ThoughtWorks, Inc
*
*  Licensed under the Apache License, Version 2.0 (the "License");
*  you may not use this file except in compliance with the License.
*  You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
*  Unless required by applicable law or agreed to in writing, software
*  distributed under the License is distributed on an "AS IS" BASIS,
*  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*  See the License for the specific language governing permissions and
*  limitations under the License.
*
*/

passColor = "#cfffcf";
failColor = "#ffcfcf";
errorColor = "#ffffff";
workingColor = "#DEE7EC";
doneColor = "#FFFFCC";

slowMode = false;

var injectedSessionId;
var cmd1 = document.createElement("div");
var cmd2 = document.createElement("div");
var cmd3 = document.createElement("div");
var cmd4 = document.createElement("div");

var postResult = "START";
var debugMode = false;
var relayToRC = null;	// override in injection.html
var queryString = null;
var proxyInjectionMode = false;
var uniqueId = 'sel_' + Math.round(100000 * Math.random());

function runSeleniumTest() {
    var testAppFrame = document.getElementById('myiframe');

    if (testAppFrame==null) {
        proxyInjectionMode = true;
    	testAppFrame = window;
    }
    else
    {
        proxyInjectionMode = false;
    }

    selenium = Selenium.createForFrame(testAppFrame);
    if (!debugMode) {
    	debugMode = getQueryVariable("debugMode");
    }
    if (proxyInjectionMode) {
        LOG.log = logToRc;
    }
    else if (debugMode) {
    	LOG.logHook = logToRc;
    }
    window.selenium = selenium;

    commandFactory = new CommandHandlerFactory();
    commandFactory.registerAll(selenium);

    currentTest = new SeleneseRunner(commandFactory);

    if (document.getElementById("commandList") != null) {
    	document.getElementById("commandList").appendChild(cmd4);
        document.getElementById("commandList").appendChild(cmd3);
        document.getElementById("commandList").appendChild(cmd2);
        document.getElementById("commandList").appendChild(cmd1);
    }

    var doContinue = getQueryVariable("continue");
	if (doContinue != null) postResult = "OK";

    currentTest.start();
}

function getQueryString() {
	if (queryString != null) return queryString;
	if (browserVersion.isHTA) {
		var args = extractArgs();
		if (args.length < 2) return null;
		queryString = args[1];
		return queryString;
        } else if (proxyInjectionMode) {
        	return selenium.browserbot.getCurrentWindow().location.search.substr(1);
    	} else {
		return top.location.search.substr(1);
	}
}

function extractArgs() {
	var str = SeleniumHTARunner.commandLine;
	if (str == null || str == "") return new Array();
    var matches = str.match(/(?:"([^"]+)"|(?!"([^"]+)")(\S+))/g);
    // We either want non quote stuff ([^"]+) surrounded by quotes
    // or we want to look-ahead, see that the next character isn't
    // a quoted argument, and then grab all the non-space stuff
    // this will return for the line: "foo" bar
    // the results "\"foo\"" and "bar"

    // So, let's unquote the quoted arguments:
    var args = new Array;
    for (var i = 0; i < matches.length; i++) {
        args[i] = matches[i];
        args[i] = args[i].replace(/^"(.*)"$/, "$1");
    }
    return args;
}

function getQueryVariable(variable) {
    var query = getQueryString();
    if (query == null) return null;
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
}

function buildBaseUrl() {
	var baseUrl = getQueryVariable("baseUrl");
        if (baseUrl != null) {
        	return baseUrl;
        }
        var s=window.location.href
        var slashPairOffset=s.indexOf("//") + "//".length
        var pathSlashOffset=s.substring(slashPairOffset).indexOf("/")
        return s.substring(0, slashPairOffset + pathSlashOffset) + "/selenium-server/core/";
}

function logToRc(message, logLevel) {
    if (logLevel==null) {
    	logLevel = "debug";
    }
    if (debugMode) {
    	sendToRC("logLevel=" + logLevel + ":" + message.replace(/[\n\r\015]/, " ") + "\n");
    }
}

function isArray(x) {
    return ((typeof x)=="object") && (x["length"]!=null);
}

function serializeString(name, s) {
    return name + "=unescape(\"" + escape(s) + "\");";
}

function serializeObject(name, x)
{
    var s = '';

    if (isArray(x))
    {
        s = name + "=new Array(); ";
        var len = x["length"];
        for (var j = 0; j<len; j++)
        {
            s += serializeString(name + "[" + j + "]", x[j]);
        }
    }
    else if (typeof x == "string")
    {
        s = serializeString(name, x);
    }
    else
    {
        throw "unrecognized object not encoded: " + name + "(" + x + ")";
    }
    return s;
}

function relayBotToRC(s) {}

function setSeleniumWindowName(seleniumWindowName) {
	selenium.browserbot.getCurrentWindow()['seleniumWindowName'] = seleniumWindowName;
}

function slowClicked() {
    slowMode = !slowMode;
}

function getIframeDocument(iframe) {
    if (iframe.contentDocument) {
        return iframe.contentDocument;
    }
    else {
        return iframe.contentWindow.document;
    }
}

SeleneseRunner = Class.create();
Object.extend(SeleneseRunner.prototype, new TestLoop());
Object.extend(SeleneseRunner.prototype, {
    initialize : function(commandFactory) {
        this.commandFactory = commandFactory;
        this.requiresCallBack = true;
        this.commandNode = null;
        this.xmlHttpForCommandsAndResults = null;
    },

    nextCommand : function() {
        var urlParms = "";
        if (postResult == "START") {
            urlParms += "seleniumStart=true";
        }
        this.xmlHttpForCommandsAndResults = XmlHttp.create();
        sendToRC(postResult, urlParms, this._HandleHttpResponse.bind(this), this.xmlHttpForCommandsAndResults);
    },

    commandStarted : function(command) {
        this.commandNode = document.createElement("div");
        var innerHTML = command.command + '(';
        if (command.target != null && command.target != "") {
            innerHTML += command.target;
            if (command.value != null && command.value != "") {
                innerHTML += ', ' + command.value;
            }
        }
        innerHTML += ")";
        this.commandNode.innerHTML = innerHTML;
        this.commandNode.style.backgroundColor = workingColor;
        if (document.getElementById("commandList") != null) {
            document.getElementById("commandList").removeChild(cmd1);
            document.getElementById("commandList").removeChild(cmd2);
            document.getElementById("commandList").removeChild(cmd3);
            document.getElementById("commandList").removeChild(cmd4);
            cmd4 = cmd3;
            cmd3 = cmd2;
            cmd2 = cmd1;
            cmd1 = this.commandNode;
            document.getElementById("commandList").appendChild(cmd4);
            document.getElementById("commandList").appendChild(cmd3);
            document.getElementById("commandList").appendChild(cmd2);
            document.getElementById("commandList").appendChild(cmd1);
        }
    },

    commandComplete : function(result) {

        if (result.failed) {
            if (postResult == "CONTINUATION") {
                currentTest.aborted = true;
            }
            postResult = result.failureMessage;
            this.commandNode.title = result.failureMessage;
            this.commandNode.style.backgroundColor = failColor;
        } else if (result.passed) {
            postResult = "OK";
            this.commandNode.style.backgroundColor = passColor;
        } else {
            if (result.result == null) {
                postResult = "OK";
            } else {
                postResult = "OK," + result.result;
            }
            this.commandNode.style.backgroundColor = doneColor;
        }
    },

    commandError : function(message) {
        postResult = "ERROR: " + message;
        this.commandNode.style.backgroundColor = errorColor;
        this.commandNode.title = message;
    },

    testComplete : function() {
        window.status = "Selenium Tests Complete, for this Test"
        // Continue checking for new results
        this.continueTest();
        postResult = "START";
    },

    _HandleHttpResponse : function() {
        if (this.xmlHttpForCommandsAndResults.readyState == 4) {
            if (this.xmlHttpForCommandsAndResults.status == 200) {
                var command = this._extractCommand(this.xmlHttpForCommandsAndResults);
                this.currentCommand = command;
                this.beginNextTest();
            } else {
                var s = 'xmlHttp returned: ' + this.xmlHttpForCommandsAndResults.status + ": " + this.xmlHttpForCommandsAndResults.statusText;
                LOG.error(s);
                this.currentCommand = null;
                setTimeout(this.beginNextTest.bind(this), 2000);
            }

        }
    },

    _extractCommand : function(xmlHttp) {
        if (slowMode) {
            this._delay(2000);
        }

        var command;
        try {
            var re = new RegExp("^(.*?)\n((.|[\r\n])*)");
            if (re.exec(xmlHttp.responseText)) {
                command = RegExp.$1;
                var rest = RegExp.$2;
                rest = rest.trim();
                if (rest) {
                    eval(rest);
                }
            }
            else {
                command = xmlHttp.responseText;
            }
        } catch (e) {
            alert('could not get responseText: ' + e.message);
        }
        if (command.substr(0, '|testComplete'.length) == '|testComplete') {
            return null;
        }

        return this._createCommandFromRequest(command);
    },


    _delay : function(millis) {
        var startMillis = new Date();
        while (true) {
            milli = new Date();
            if (milli - startMillis > millis) {
                break;
            }
        }
    },

// Parses a URI query string into a SeleniumCommand object
    _createCommandFromRequest : function(commandRequest) {
        //decodeURIComponent doesn't strip plus signs
        var processed = commandRequest.replace(/\+/g, "%20");
        // strip trailing spaces
        var processed = processed.replace(/\s+$/, "");
        var vars = processed.split("&");
        var cmdArgs = new Object();
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            cmdArgs[pair[0]] = pair[1];
        }
        var cmd = cmdArgs['cmd'];
        var arg1 = cmdArgs['1'];
        if (null == arg1) arg1 = "";
        arg1 = decodeURIComponent(arg1);
        var arg2 = cmdArgs['2'];
        if (null == arg2) arg2 = "";
        arg2 = decodeURIComponent(arg2);
        if (cmd == null) {
            throw new Error("Bad command request: " + commandRequest);
        }
        return new SeleniumCommand(cmd, arg1, arg2);
    }

})


function sendToRC(dataToBePosted, urlParms, callback, xmlHttpObject, async) {
    if (async==null) {
    	async = true;
    }
    if (xmlHttpObject==null) {
 	xmlHttpObject = XmlHttp.create();
    }
    var url = buildBaseUrl() + "driver/?"
    if (urlParms) {
    	url += urlParms;
    }
    url += "&localFrameAddress=" + (proxyInjectionMode ? makeAddressToAUTFrame() : "top");
    url += "&seleniumWindowName=" + getSeleniumWindowName();
    url += "&uniqueId=" + uniqueId;

    if (callback==null) {
    	callback = function(){};
    }
    url += buildDriverParams() + preventBrowserCaching();
    xmlHttpObject.open("POST", url, async);
    xmlHttpObject.onreadystatechange = callback;
    xmlHttpObject.send(dataToBePosted);
    return null;
}

function buildDriverParams() {
    var params = "";

    var host = getQueryVariable("driverhost");
    var port = getQueryVariable("driverport");
    if (host != undefined && port != undefined) {
        params = params + "&driverhost=" + host + "&driverport=" + port;
    }

    var sessionId = getQueryVariable("sessionId");
    if (sessionId == undefined) {
    	sessionId = injectedSessionId;
    }
    if (sessionId != undefined) {
        params = params + "&sessionId=" + sessionId;
    }
    return params;
}

function preventBrowserCaching() {
    var t = (new Date()).getTime();
    return "&counterToMakeURsUniqueAndSoStopPageCachingInTheBrowser=" + t;
}

// Return the name of the current window in the selenium recordkeeping.
//
// In selenium, the additional widow has no name.
//
// Additional pop-ups are associated with names given by the argument to the routine waitForPopUp.
//
// I try to arrange for widows which are opened in such manner to track their own names using the top-level property
// seleniumWindowName, but it is possible that this property will not be available (if the widow has just reloaded
// itself).  In this case, return "?".
//
function getSeleniumWindowName() {
	var w = (proxyInjectionMode ? selenium.browserbot.getCurrentWindow() : window);
	if (w.opener==null) {
        	return "";
        }
        if (w["seleniumWindowName"]==null) {
        	return "?";
        }
        return w["seleniumWindowName"];
}

// construct a JavaScript expression which leads to my frame (i.e., the frame containing the window
// in which this code is operating)
function makeAddressToAUTFrame(w, frameNavigationalJSexpression)
{
    if (w==null)
    {
        w=top;
        frameNavigationalJSexpression = "top";
    }

    if (w==selenium.browserbot.getCurrentWindow())
    {
        return frameNavigationalJSexpression;
    }
    for (var j = 0; j < w.frames.length; j++)
    {
        var t = makeAddressToAUTFrame(w.frames[j], frameNavigationalJSexpression + ".frames[" + j + "]");
        if (t!=null)
        {
            return t;
        }
    }
    return null;
}
