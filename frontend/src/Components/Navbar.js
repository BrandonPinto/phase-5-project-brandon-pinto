import { Box, IconButton, Typography, useTheme } from "@mui/material";
import { useContext } from "react";
import { ColorModeContext, tokens } from "../Theme";
import InputBase from "@mui/material/InputBase";
import LightModeOutlinedIcon from "@mui/icons-material/LightModeOutlined";
import DarkModeOutlinedIcon from "@mui/icons-material/DarkModeOutlined";
import NotificationsOutlinedIcon from "@mui/icons-material/NotificationsOutlined";
import SettingsOutlinedIcon from "@mui/icons-material/SettingsOutlined";
import PersonOutlinedIcon from "@mui/icons-material/PersonOutlined";
import SearchIcon from "@mui/icons-material/Search"


const Navbar = () => {
const theme = useTheme()
const colors = tokens(theme.palette.mode)
const colorMode = useContext(ColorModeContext)

return (
<Box display="flex" justifyContent="space-between" p={2}>

  <Box
  display="flex"
  backgroundColor={colors.primary[400]}
  borderRadius="3px"
  >
    <InputBase sx={{
    ml: 5,
    margin: "1",
    flex: 1,
    width: "280px"
    }} placeholder="Search Events"/>
    <IconButton type="button" sx={{p:1}}>
    <SearchIcon />
    </IconButton>
  </Box>
  <Box>
    <Typography sx={{
      fontSize: "35px"
    }}
    >TEST</Typography>
  </Box>
  <Box>
    <IconButton onClick={colorMode.toggleColorMode}>
    {theme.palette.mode === "dark" ? (
      <DarkModeOutlinedIcon />
    ) : (
      <LightModeOutlinedIcon />
    )}
    </IconButton>
    <IconButton>
    <PersonOutlinedIcon />
    </IconButton>
    <IconButton>
      <NotificationsOutlinedIcon/>
    </IconButton>
    <IconButton>
      <SettingsOutlinedIcon />
    </IconButton>
  </Box>
</Box>
  );
};
export default Navbar;