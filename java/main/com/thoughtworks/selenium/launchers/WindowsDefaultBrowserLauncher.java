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

package com.thoughtworks.selenium.b.launchers;

import com.thoughtworks.selenium.b.BrowserLauncher;

import java.io.IOException;

/**
 * @author Paul Hammant
 * @version $Revision: 1.1 $
 */
public class WindowsDefaultBrowserLauncher implements BrowserLauncher {

    Runtime runtime = Runtime.getRuntime();

    public void launch(String url) {
        try {
            String command = "rundll32 url.dll,FileProtocolHandler " + url;
            runtime.exec(command);
        } catch (IOException e) {
            throw new RuntimeException("Could not launch default browser.", e);
        }
    }

    public static void main(String[] args) {
        new WindowsDefaultBrowserLauncher().launch("http://www.google.com");
    }
}