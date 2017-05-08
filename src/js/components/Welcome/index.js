import React, { Component } from 'react'
import './index.css'

export default class Counter extends Component {
  componentDidMount() {
    //SSRではここは呼ばれない（クライアント側では呼ばれる）なので実質2回呼ばれる
    console.log('componentDidMount')
  }

  componentWillMount() {
    //SSRでもここは呼ばれる
    console.log('componentWillMount')
  }

  render() {
    const { count, onIncrement, onDecrement } = this.props
    return (
      <div className="count">
        <p>カウント: {count}回</p>
        <button onClick={onIncrement}>++</button>
        <button onClick={onDecrement}>--</button>
      </div>
    )
  }
}