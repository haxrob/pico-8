pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

function _draw()
	for y=0,127 do
		for x=0,127 do
			i=0
			zx=0
			zy=0
			cx = -2 +x/32
			cy= -2+y/32
			while ((i<17) and (zx*zx+zy*zy <4)) do
				xt = zx*zy
				zx=zx*zx - zy*zy + cx
				zy = 2*xt+cy
				i=i+1
			end
			pset(x,y,i)
		end
	end
end
