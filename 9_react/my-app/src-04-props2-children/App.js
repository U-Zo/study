import React, { Component } from 'react';
import './App.css';
import Contact from './components/Contact';

class App extends Component {
  render() {
    return (
      <div>
        <Contact mesg="홍길동" mesg2="10">
          Hello World <span>Happy</span>
        </Contact>
      </div>
    );
  }
}

export default App;
