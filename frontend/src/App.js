import Calendar from './Components/Calendar';
import { CssBaseline, ThemeProvider } from "@mui/material";
import { ColorModeContext, useMode } from "./Theme";


function App() {

//   const [loggedIn, setLoggedIn] = useState({})
//   navigate = useNavigate()
// useEffect(() => {
//   let token = localStorage.getItem("jwt");
//   if (token && !user.username) {
//     fetch(`http://localhost:3000/me`, {
//       method: "GET",
//       headers: {
//         token: token,
//         "Content-Type": "application/json",
//       },
//     })
//       .then((res) => res.json())
//       .then((data) => {console.log(data)
//         setUser({
//           name: data.username,
//         });
//       });
//   } else {
//     navigate('/register')
//   }
// }, [user.username])


const [theme, colorMode] = useMode();


  return (
<ColorModeContext.Provider value={colorMode}>
<ThemeProvider theme={theme}>
<CssBaseline />
    <div className="App">
      <Calendar/>           
    </div>
    </ThemeProvider>
    </ColorModeContext.Provider>
  );
}

export default App;
