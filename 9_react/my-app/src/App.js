import React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import './App.css';
import Home from './components/Home';
import Login from './components/Login';
import Member from './components/Member';
import MyPage from './components/MyPage';
import NoMatch from './components/NoMatch';
import Posts from './components/Posts';
import Navi from './navi/Navi';

const App = () => {
  return (
    <>
      <BrowserRouter>
        <Navi />
        <hr />
        <Switch>
          <Route component={Home} path="/" exact />
          <Route component={Login} path="/login" exact />
          <Route component={Member} path={['/member/:id', '/member']} exact />
          <Route component={MyPage} path="/mypage" exact />
          <Route component={Posts} path="/posts" />
          <Route component={NoMatch} />
        </Switch>
      </BrowserRouter>
    </>
  );
};

export default App;
