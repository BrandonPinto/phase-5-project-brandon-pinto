import { Box, IconButton, Typography, useTheme } from "@mui/material";
import { useContext } from "react";
import { ColorModeContext} from "../Theme";
import LightModeOutlinedIcon from "@mui/icons-material/LightModeOutlined";
import DarkModeOutlinedIcon from "@mui/icons-material/DarkModeOutlined";
import NotificationsOutlinedIcon from "@mui/icons-material/NotificationsOutlined";
import CalendarViewMonthIcon from '@mui/icons-material/CalendarViewMonth';
import SettingsOutlinedIcon from "@mui/icons-material/SettingsOutlined";
import DialpadIcon from '@mui/icons-material/Dialpad';
import PeopleIcon from '@mui/icons-material/People';
import AccountBoxIcon from '@mui/icons-material/AccountBox';
import LogoutIcon from '@mui/icons-material/Logout';
import {NavLink} from "react-router-dom";
import { useNavigate } from "react-router-dom";



const Navbar = () => {
  
let nav = useNavigate()

let handleLogout = (e) => {
    if(e)
    localStorage.clear()
    nav("/Homepage")
  }



const theme = useTheme()

const colorMode = useContext(ColorModeContext)

// let onMouseOver = (e) => {
//   if(e)
//   return console.log("Calendar")
// }

return (

<Box display="flex" justifyContent="space-between" p={2}>

  <Box>
    <Typography sx={{
      fontSize: "35px"
    }}
    >Calendar4U</Typography>
  </Box>
  <Box>
    <IconButton onClick={colorMode.toggleColorMode}>
    {theme.palette.mode === "dark" ? (
      <DarkModeOutlinedIcon />
    ) : (
      <LightModeOutlinedIcon />
    )}
    </IconButton>
    <NavLink to="/Calendar"><IconButton>
      <CalendarViewMonthIcon name="calendar"/>
    </IconButton></NavLink>
    <NavLink to="/HostedEvent"><IconButton>
      <PeopleIcon name="events"/>
    </IconButton></NavLink>
    <NavLink to="/Contacts"><IconButton >
      <DialpadIcon name="contacts" />
    </IconButton></NavLink>
    <IconButton>
      <NotificationsOutlinedIcon name="notifications"/>
    </IconButton>
    <NavLink to="/Profile"><IconButton >
    <AccountBoxIcon name="profile"/>
    </IconButton></NavLink>
    <NavLink to="/Settings"><IconButton>
      <SettingsOutlinedIcon name="settings"/>
    </IconButton></NavLink>
    <IconButton onClick={handleLogout}>
      <LogoutIcon name="logout"/>
    </IconButton>

  </Box>
</Box>
  );
};
export default Navbar;