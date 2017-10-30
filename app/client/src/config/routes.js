import {Component} from 'react';
import {connect} from 'react-redux';
import {Route, withRouter, Switch, BrowserRouter as Router} from 'react-router-dom';

import App from 'containers/app';

class Routes extends Component {
  render() {
    return (
      <Router>
        <div>
          <Switch>
            <Route exact path='/' component={App} />
          </Switch>
        </div>
      </Router>
    );
  }
}

const mapStateToProps = state => {
  return {};
};

export default withRouter(connect(mapStateToProps)(Routes));
