import { createStore } from 'redux'
import counterReducer, {initialState} from '../reducers/Welcome'

export default (preloadState = {}) => {
  return createStore(counterReducer, {...initialState, ...preloadState})
}
