import {Component} from 'react';
import {render} from 'react-dom';
import {Provider} from 'react-redux';
import {ConnectedRouter} from 'react-router-redux';
// import {persistStore} from 'redux-persist';

import store, {history} from './store';
import Routes from './config/routes';
import 'bootstrap/dist/js/bootstrap';

class AppProvider extends Component {
  constructor() {
    super();
    // this.state = {
    //   rehydrated: false
    // };
  }

  // componentWillMount() {
  //   persistStore(store, {}, () => {
  //     this.setState({rehydrated: true});
  //   });
  // }

  render() {
    // if (!this.state.rehydrated) {
    //   return <div>Loading...</div>;
    // }
    return (
      <Provider store={store}>
        <ConnectedRouter history={history}>
          <Routes />
        </ConnectedRouter>
      </Provider>
    );
  }
}

$(document).on('turbolinks:load', () => {
  render(
    <AppProvider />, document.getElementById('root')
  );
});
