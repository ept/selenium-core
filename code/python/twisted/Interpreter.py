

#
# Command Translater
#
def translate(command, target, value=""):
    """ Translate an api call into selenese command. """
    result = "|%s|%s|%s|" % (command, target, value)
    return result

from Dispatcher import Dispatcher

class SeleniumInterpreter(Dispatcher):
    """ Performs the following:
        1) Translates python API calls into Selenese commands,
        2) Sends the command string to the command dispatcher.

    Interpreter:
         _Computer Science_: A program that translates an instruction into a 
         machine language and executes it before proceeding to the next instruction.
         (source: http://dictionary.reference.com/search?q=Interpreter)
    """

    def __init__(self):
        Dispatcher.__init__(self)
       
    def driver(self, request):
        """ expose dispatcher's webDriver method to web requests """
        return self.webDriver(request)
    

    def dispatchCommand(self, command, target, value=""):
        command_string = translate(command, target, value)        
        return self.apiDriver(command_string)

    #
    # Selenium Commands       
    #
    def chooseCancelOnNextConfirmation():
        """ pass """
        pass
        
    def click(self, target):
        """ Click on the target """
        return self.dispatchCommand("click", target)
        
    def clickAndWait(self, target):
        """ Click on the target and wait for a page load event """
        return self.dispatchCommand("clickAndWait", target)
        
    def open(self, path):
        """ Goto the specified URL """
        return self.dispatchCommand("open", path)
        
    def pause(self, duration): # is this needed for driven ?
        """ pause for a period of time in seconds """
        return self.dispatchCommand("pause")
        
    def selectAndWait(self, field, value):
        """ select the target and wait for a page load event """
        return self.dispatchCommand("selectAndWait",field,value)
        
    def selectWindow(window):
        """ pass """
        pass
        
    def setTextField(field, value):
        """ pass """
        pass
        
    def storeText(element, value):
        """ pass """
        pass
        
    def storeValue(field, value):
        """ pass """
        pass
        
    def testComplete(self):
        """ Tell the browser the test is complete """
        return self.dispatchCommand("testComplete")
        
    def type(field, value):
        """ pass """
        pass
        
    def typeAndWait(field, value):
        """ pass """
        pass
        
    def verifyAlert(alert):
        """ pass """
        pass
        
    def verifyAttribute(element, value):
        """ pass """
        pass
        
    def verifyConfirmation(confirmation):
        """ pass """
        pass
        
    def verifyElementNotPresent(type):
        """ pass """
        pass
        
    def verifyElementPresent(type):
        """ pass """
        pass
        
    def verifyLocation(location):
        """ pass """
        pass
        
    def verifySelectOptions(field, values):
        """ pass """
        pass
        
    def verifySelected(field, value):
        """ pass """
        pass
        
    def verifyTable(table, value):
        """ pass """
        pass
        
    def verifyText(type, text):
        """ pass """
        pass
        
    def verifyTextPresent(type, text):
        """ pass """
        pass
        
    def verifyTitle(title):
        """ pass """
        pass
        
    def verifyValue(field, value):
        """ pass """
        pass
            