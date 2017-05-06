import React, { Component } from 'react'
import { Provider, connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import * as Actions from '../../actions/Welcome'
import Counter from '../../components/Welcome'

class App extends Component {
  constructor(props) {
    super(props)
//    this.state = {data: {}}
  }

  render() {
    const { data, actions } = this.props
    return (
      <Counter {...data} onIncrement={actions.increment} onDecrement={actions.decrement} />
    )
  }
}

const mapStateToProps = (state) => {
  return {
    data: state
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    actions: bindActionCreators(Actions, dispatch)
  }
/*
// not use redux-actions
  return {
    onIncrement() { return dispatch(increment) },
    onDecrement() { return dispatch(decrement) }
  }
*/
}

export default connect(mapStateToProps, mapDispatchToProps)(App)