import { Typography, Box, useTheme } from "@mui/material";
import { tokens } from "../Theme"

const Header = ({ title, subtitle }) => {

  const theme = useTheme();
  const colors = tokens(theme.palette.mode);
  return (
    <Box mb="25px">
      <Typography
        variant="h2"
        color={colors.grey[100]}
        fontWeight="bold"
        textAlign="center"
        
      >
        {title}
      </Typography>
      <Typography variant="h4" color={colors.greenAccent[400]} textAlign="center">
        {subtitle}
      </Typography>
    </Box>
  );
};

export default Header;