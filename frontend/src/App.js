import Calendar from './Components/Calendar';
import { CssBaseline, ThemeProvider } from "@mui/material";
import { ColorModeContext, useMode } from "./Theme";
import Profile from './Components/Profile';
import { Routes, Route, useNavigate } from 'react-router-dom';
import Login from './Components/Login';
import Signup from './Components/Signup';
import Homepage from './Components/Homepage';
import HostedEvent from './Components/HostedEvent';
import Contacts from './Components/Contacts';
import {useState, useEffect} from 'react';

function App() {

const [user, setUser] = useState(null)
const [userEvents, setUserEvents] = useState([])
const [userCommunityEvents, setUserCommunityEvents] = useState([])
const [userEventsToRemove, setUserEventsToRemove] = useState([])


let nav = useNavigate()

useEffect(() => {
  let token = localStorage.getItem("token")
  if (token && !user) {
    fetch(`http://localhost:3000/me`, {
      headers: {
        token: token,
        "Content-Type": "application/json",
      },
    })
      .then((res) => res.json())
      .then((user) => {
        //console.log(user)
        setUser(user)
        setUserCommunityEvents(user[0].community_events)
        setUserEvents(user[0].personal_events)
        setUserEventsToRemove(user[0].personal_events)
    }).then(nav("/Calendar"));
  }
},[nav, user])





const [theme, colorMode] = useMode();

  return (

<ColorModeContext.Provider value={colorMode}>
<ThemeProvider theme={theme}>
<CssBaseline />
    <div className="App">
      
      <main className="content">
      <Routes>
        <Route path="/Homepage" element={<Homepage /> } />
        <Route path="/Contacts" element={<Contacts /> } />
        <Route path="/Profile" element={<Profile /> } />
        <Route path="/Calendar" element={<Calendar setUserEventsToRemove={setUserEventsToRemove} userEventsToRemove={userEventsToRemove} user={user} userEvents={userEvents} setUserEvents={setUserEvents} userCommunityEvents={userCommunityEvents} setUserCommunityEvents={setUserCommunityEvents}/> } />
        <Route path="/HostedEvent" element={<HostedEvent /> } />
        <Route path="/Signup" element={<Signup /> } />
        <Route path="/Login" element={<Login /> } />
      </Routes>   
      </main>    
    </div>
    </ThemeProvider>
    </ColorModeContext.Provider>
  );
}

export default App;
