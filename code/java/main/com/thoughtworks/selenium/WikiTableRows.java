/*
 * Copyright 2004 ThoughtWorks, Inc.
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
package com.thoughtworks.selenium;

import edu.emory.mathcs.util.concurrent.Exchanger;

/**
 * This class implement's the three methods that are required by the Selenium XML-RPC
 * interface for Wiki table rows.
 *
 * @author Aslak Helles&oslash;y
 * @version $Revision: 1.3 $
 */
public class WikiTableRows {
    private final Exchanger commandExchanger;
    private final Exchanger resultExchanger;

    public WikiTableRows(Exchanger commandExchanger, Exchanger resultExchanger) {
        this.commandExchanger = commandExchanger;
        this.resultExchanger = resultExchanger;
    }

    public String getRow() throws InterruptedException {
        return (String) commandExchanger.exchange(null);
    }

    public void setResult(String result) throws InterruptedException {
        resultExchanger.exchange(result);
    }

    public void setException(String message) throws InterruptedException {
        resultExchanger.exchange(new SeleniumException(message));
    }

}