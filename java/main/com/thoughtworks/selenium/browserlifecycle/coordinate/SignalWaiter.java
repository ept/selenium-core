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
package com.thoughtworks.selenium.browserlifecycle.coordinate;

public class SignalWaiter implements Waiter, Listener {

	private boolean _signalled = false;

	public SignalWaiter(Audible audible) {
		audible.addListener(this);
	}

	public synchronized void waitFor(long attentionSpan)
			throws InterruptedException {
		if (!_signalled) {
			this.wait(attentionSpan);
		}
	}

	public synchronized void signal() {
		_signalled = true;
		this.notify();
	}
}