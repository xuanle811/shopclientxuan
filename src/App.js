import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'
import { PublicRoutes } from '~/routes'
import './assets/boxicons-2.0.7/css/boxicons.min.css'
import './sass/index.scss'
import { store } from './redux/store'
import { Provider } from 'react-redux'
import Layout from './components/Layout'

function App() {
  return (
    <Router>
      <div className="App">
        <PublicRoutes/>
      </div>
    </Router>
  );
}

export default App;
