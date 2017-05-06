import React, { PropTypes } from 'react';
import { renderReactRedux } from 'hypernova-react-redux';

import { createStore } from 'redux';
import { Provider, connect } from 'react-redux';

// Component
function Counter(props) {
  const { count, onIncrement, onDecrement } = props;
  return (
    <div>
      <p>カウント: {count}回</p>
      <button onClick={onIncrement}>++</button>
      <button onClick={onDecrement}>--</button>
    </div>
  );
}
Counter.propTypes = {
  count:       PropTypes.number.isRequired,
  onIncrement: PropTypes.func.isRequired,
  onDecrement: PropTypes.func.isRequired
};

// Actions
const INCREMENT_COUNTER = {
  type: 'INCREMENT_COUNTER'
};
const DECREMENT_COUNTER = {
  type: 'DECREMENT_COUNTER'
};

// Reducer
function counterReducer(state = { count: 0 }, action) {
  switch(action.type) {
  case 'INCREMENT_COUNTER':
    return { count: state.count + 1 };
  case 'DECREMENT_COUNTER':
    return { count: state.count - 1 };
  default:
    return state;
  }
}

// configureStore
function configureStore(preloadState = {}) {
  const initialState = counterReducer(undefined, {});
  return createStore(
    counterReducer,
    Object.assign({}, initialState, preloadState)
  );
}

// connect (react-redux)
function mapStateToProps(state) {
  return { count: state.count };
}

function mapDispatchToProps(dispatch) {
  return {
    onIncrement() { return dispatch(INCREMENT_COUNTER); },
    onDecrement() { return dispatch(DECREMENT_COUNTER); }
  };
}

let ConnectedMyComponent = connect(
  mapStateToProps,
  mapDispatchToProps
)(Counter);


module.exports = renderReactRedux(
  'MyComponent.js',
  ConnectedMyComponent,
  configureStore
);