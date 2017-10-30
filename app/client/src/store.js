import {routerReducer, routerMiddleware} from 'react-router-redux';
import {createStore, combineReducers, applyMiddleware} from 'redux';
import {persistStore, autoRehydrate} from 'redux-persist';
import thunk from 'redux-thunk';
import {REHYDRATE} from 'redux-persist/constants';
import createActionBuffer from 'redux-action-buffer';
import createHistory from 'history/createBrowserHistory';

import {composeWithDevTools} from 'redux-devtools-extension';

import rootReducer from './modules';

export const history = createHistory();

const middleware = routerMiddleware(history);

const store = createStore(
  combineReducers({
    ...rootReducer,
    router: routerReducer
  }),
  composeWithDevTools(
    autoRehydrate(),
    applyMiddleware(
      thunk,
      middleware,
      createActionBuffer(REHYDRATE)
    ),
  )
);

persistStore(store);

export default store;
