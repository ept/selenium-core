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

package com.thoughtworks.selenium.embedded.jetty;

import com.thoughtworks.selenium.DefaultSelenium;
import com.thoughtworks.selenium.Selenium;
import com.thoughtworks.selenium.launchers.SystemDefaultBrowserLauncher;
import junit.framework.TestCase;

import java.io.File;

/**
 * @author Paul Hammant
 * @version $Revision: 131 $
 */
public class RealDealIntegrationTest extends TestCase {

    Selenium selenium;

    protected void setUp() throws Exception {
        super.setUp();
        File codeRoot;
        String codeRootProperty = System.getProperty("code_root");
        if (codeRootProperty == null) {
            throw new Exception("'code_root' not specified");
        } else {
            codeRoot = new File(codeRootProperty);
            if (!codeRoot.exists()) {
                throw new Exception("'code_root' not a dir");
            }
        }
        selenium = new DefaultSelenium(
                new JettyCommandProcessor(new File(codeRoot, "javascript/tests/html"), DefaultSelenium.DEFAULT_SELENIUM_CONTEXT,
                        new DirectoryStaticContentHandler(new File(codeRoot, "javascript"))),
                new SystemDefaultBrowserLauncher()
        );
        selenium.start();
    }

    protected void tearDown() throws Exception {
        Thread.sleep(2 * 1000);
        selenium.stop();
    }

    public void testWithJavaScript() {
        selenium.open("/test_click_page1.html");
        selenium.verifyText("link", "Click here for next page");
        selenium.clickAndWait("link");
        selenium.verifyLocation("/test_click_page2.html");
        selenium.clickAndWait("previousPage");
        selenium.testComplete();
    }
}