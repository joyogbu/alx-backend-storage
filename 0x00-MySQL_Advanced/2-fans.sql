/* SQL script that ranks country origins of bands, ordered by the number of (non-unique) fans */

--rank country by number of fans
SELECT origin, fans AS nb_fans GROUP BYorigin;
