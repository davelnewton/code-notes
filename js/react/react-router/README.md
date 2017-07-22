<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [React Router](#react-router)
	- [Docs](#docs)
	- [Misc](#misc)
	- [Multiple Layouts](#multiple-layouts)
	- [Tutorials](#tutorials)
	- [How to do auth](#how-to-do-auth)
	- [react-router-bootstrap](#react-router-bootstrap)
	- [Redirecting after a login](#redirecting-after-a-login)
	- [Related Links](#related-links)

<!-- /TOC -->

# React Router

React Router 4+ is complete different than before. Old tutorials are 100% obsolete.

## Docs

* https://reacttraining.com/react-router/web/guides/philosophy

## Misc

* https://medium.com/@notrab/getting-started-with-create-react-app-redux-react-router-redux-thunk-d6a19259f71f<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [React Router](#react-router)
	- [Docs](#docs)
	- [Misc](#misc)
	- [Multiple Layouts](#multiple-layouts)
	- [Tutorials](#tutorials)
	- [How to do auth](#how-to-do-auth)
	- [react-router-bootstrap](#react-router-bootstrap)
	- [Redirecting after a login](#redirecting-after-a-login)
	- [Related Links](#related-links)

<!-- /TOC --><!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [React Router](#react-router)
	- [Docs](#docs)
	- [Misc](#misc)
	- [Multiple Layouts](#multiple-layouts)
	- [Tutorials](#tutorials)
	- [How to do auth](#how-to-do-auth)
	- [react-router-bootstrap](#react-router-bootstrap)
	- [Redirecting after a login](#redirecting-after-a-login)
	- [Related Links](#related-links)

<!-- /TOC --><!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [React Router](#react-router)
	- [Docs](#docs)
	- [Misc](#misc)
	- [Multiple Layouts](#multiple-layouts)
	- [Tutorials](#tutorials)
	- [How to do auth](#how-to-do-auth)
	- [react-router-bootstrap](#react-router-bootstrap)
	- [Redirecting after a login](#redirecting-after-a-login)
	- [Related Links](#related-links)

<!-- /TOC -->
* https://github.com/notrab/create-react-app-redux

## Multiple Layouts

* https://stackoverflow.com/questions/43333920/multiple-layouts-with-react-router-v4/44666358#44666358
* https://simonsmith.io/reusing-layouts-in-react-router-4/

## Tutorials

* https://medium.com/@pshrmn/a-simple-react-router-v4-tutorial-7f23ff27adf
  * https://codepen.io/pshrmn/pen/YZXZqM?editors=0010

## How to do auth

* https://gist.github.com/fdidron/ebcf52dc1ed62ff7d80725854d631a9e
* https://stackoverflow.com/questions/43164554/how-to-implement-authenticated-routes-in-react-router-4
* https://medium.com/the-many/adding-login-and-authentication-sections-to-your-react-or-react-native-app-7767fd251bd1
* https://stormpath.com/blog/build-a-react-app-with-user-authentication

## react-router-bootstrap

https://github.com/react-bootstrap/react-router-bootstrap

## Redirecting after a login

Original source: https://gist.github.com/verticalgrain/195468e69f2ac88f3d9573d285b09764

```js
import React, { Component } from 'react'
import { Redirect } from 'react-router'

export default class ContactForm extends Component {
  state = { fireRedirect: false }

  submitForm = e => {
    e.preventDefault()
    this.setState({ fireRedirect: true })
  }

  getFrom = () => this.props.location.state || '/'

  render = () =>
    <div>
      <form onSubmit={this.submitForm}>
        <button type="submit">Submit</button>
      </form>
      {this.state.fireRedirect && (<Redirect to={this.getFrom()}/>)}
    </div>
}
```

## Related Links

* https://stackoverflow.com/questions/42123261/programmatically-navigate-using-react-router-v4
