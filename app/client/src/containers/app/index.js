import {Component} from 'react';
import {connect} from 'react-redux';

class App extends Component {
  render () {
    return (
      <div>
        Hello Trung abc
      </div>
    );
  }
}

const mapStateToProps = state => {
  return {};
};

export default connect(mapStateToProps)(App);
