// ambient sound event handler

// https://quicksounds.com/#
// https://audiotoolset.com/editor

class idleambiance_EventHandler : EventHandler
{
    const CHAN_AMBIENCE = 20;
    //const CHAN_AUTO = 0;
// ITEMS------------- ITEMS-------------ITEMS-------------

	struct item
	{
		string cname;
		string sname;
		int flags;
		double volume;
	}
	item ItemSounds[50];
	int iCounter;

// ITEMS------------- ITEMS-------------ITEMS-------------
	struct flat
	{
		name fname;
		int type;
		int height;
		sound sname;
		int flags;
		double volume;

	}
	flat FlatSounds[130];
	int fCounter;
// ITEMS------------- ITEMS-------------ITEMS-------------
	
	void addItemSounds(string cname, string sname, int flags, double volume = 1.0)
	{
		ItemSounds[iCounter].cname = cname;
		ItemSounds[iCounter].sname = sname;
		ItemSounds[iCounter].flags = flags;
		ItemSounds[iCounter].volume = volume;
		iCounter++;
	}
    
// ITEMS------------- ITEMS-------------ITEMS-------------
	void addFlatSounds(name fname, int type, int height, string sname, int flags, double volume = 1.0)
	{
		FlatSounds[fCounter].fname = fname;
		FlatSounds[fCounter].type = type;
		FlatSounds[fCounter].height = height;
		FlatSounds[fCounter].sname = sname;
		FlatSounds[fCounter].flags = flags;
		FlatSounds[fCounter].volume = volume;
		//FlatSounds[fCounter].volume = (volume * fVolMult.GetFloat())
		fCounter++;
	}
	void LoadArrays()
	{
		iCounter = 0;
		fCounter = 0;
		int FLOOR = 0;
		int CEILING = 1;

        /*
        // used in sound call
        CVar fVolMult = CVar.FindCVar('uniamb_fVol');
        console.printf("%f", fVolMult.GetFloat()); // debug
		*/

           // items name, soundname, flags, volume
        // ---Can only play one, deprecated
        /*
        addItemSounds("TechPillar", "portal_beam_loop1", CHANF_LISTENERZ | CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
		addItemSounds("Column", "buzz", CHANF_LISTENERZ | CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
		addItemSounds("TechLamp", "buzz", CHANF_LISTENERZ | CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
		addItemSounds("TechLamp2", "buzz", CHANF_LISTENERZ | CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        */

            // flats name, flats type, flats height, soundname, flags, volume
            // Things at the top have top priority in ambience played eg Sky vs nukage E1M1

        // Debugging doomrunner cmdline
        // +notarget +noclip +god +vid_fps 1

        // flats name, type, height, soundname, flags, volume
        // liquids
        //water
		addFlatSounds("FWATER1", FLOOR, 64, "lake_water", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
		addFlatSounds("FWATER2", FLOOR, 64, "lake_water", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
		addFlatSounds("FWATER3", FLOOR, 64, "lake_water", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
		addFlatSounds("FWATER4", FLOOR, 64, "lake_water", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
		addFlatSounds("SWATER1", FLOOR, 64, "lake_water", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
		addFlatSounds("SWATER2", FLOOR, 64, "lake_water", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
		addFlatSounds("SWATER3", FLOOR, 64, "lake_water", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
		addFlatSounds("SWATER4", FLOOR, 64, "lake_water", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        //nukage
		addFlatSounds("NUKAGE1", FLOOR, 64, "radioactive", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
		addFlatSounds("NUKAGE2", FLOOR, 64, "radioactive", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
		addFlatSounds("NUKAGE3", FLOOR, 64, "radioactive", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("NUKAGE4", FLOOR, 64, "radioactive", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        //lava
		addFlatSounds("LAVA1", FLOOR, 64, "lava_loop", CHANF_LISTENERZ | CHANF_LOOPING, 2.0);
		addFlatSounds("LAVA2", FLOOR, 64, "lava_loop", CHANF_LISTENERZ | CHANF_LOOPING, 2.0);
		addFlatSounds("LAVA3", FLOOR, 64, "lava_loop", CHANF_LISTENERZ | CHANF_LOOPING, 2.0);
        addFlatSounds("LAVA4", FLOOR, 64, "lava_loop", CHANF_LISTENERZ | CHANF_LOOPING, 2.0);
        //hot rocks
		addFlatSounds("SLIME09", FLOOR, 64, "burning_coal", CHANF_LISTENERZ | CHANF_LOOPING, 2.5);
		addFlatSounds("SLIME10", FLOOR, 64, "burning_coal", CHANF_LISTENERZ | CHANF_LOOPING, 2.5);
		addFlatSounds("SLIME11", FLOOR, 64, "burning_coal", CHANF_LISTENERZ | CHANF_LOOPING, 2.5);
		addFlatSounds("SLIME12", FLOOR, 64, "burning_coal", CHANF_LISTENERZ | CHANF_LOOPING, 2.5);
		addFlatSounds("RROCK01", FLOOR, 64, "burning_coal", CHANF_LISTENERZ | CHANF_LOOPING, 2.5);
		addFlatSounds("RROCK02", FLOOR, 64, "burning_coal", CHANF_LISTENERZ | CHANF_LOOPING, 2.5);
        //blood
        addFlatSounds("BLOOD1", FLOOR, 64, "ambience6", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP); //lazy
        addFlatSounds("BLOOD2", FLOOR, 64, "ambience6", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("BLOOD3", FLOOR, 64, "ambience6", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        //slime
        addFlatSounds("SLIME01", FLOOR, 64, "boiling_water_(slime)", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("SLIME02", FLOOR, 64, "boiling_water_(slime)", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("SLIME03", FLOOR, 64, "boiling_water_(slime)", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("SLIME04", FLOOR, 64, "boiling_water_(slime)", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("SLIME05", FLOOR, 64, "boiling_water_(slime)", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("SLIME06", FLOOR, 64, "boiling_water_(slime)", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("SLIME07", FLOOR, 64, "boiling_water_(slime)", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("SLIME08", FLOOR, 64, "boiling_water_(slime)", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        // liquids

        // Grass -unseen
	    addFlatSounds("GRASS1", FLOOR, 64, "outdoor", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
	    addFlatSounds("GRASS2", FLOOR, 64, "outdoor", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
	    //addFlatSounds("RROCK20", FLOOR, 64, "outdoor", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
	    //addFlatSounds("RROCK19", FLOOR, 64, "outdoor", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);

        // Computers -unseen
        addFlatSounds("CONS1_1", CEILING, 64, "combine_terminal_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("CONS1_5", CEILING, 64, "combine_terminal_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("CONS1_7", CEILING, 64, "combine_terminal_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("CONS1_1", FLOOR, 64, "combine_terminal_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("CONS1_5", FLOOR, 64, "combine_terminal_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        addFlatSounds("CONS1_7", FLOOR, 64, "combine_terminal_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        
        // Flesh -unseen
        addFlatSounds("SFLR6_1", FLOOR, 64, "ambience6", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("SFLR6_4", FLOOR, 64, "ambience6", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("SFLR7_1", FLOOR, 64, "ambience6", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("SFLR7_4", FLOOR, 64, "ambience6", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("SKIN2", FLOOR, 64, "ambience6", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        // Flesh

        // Hell -unseen
        addFlatSounds("FLOOR6_1", FLOOR, 64, "laundry_machine1_amb_(hell)", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        addFlatSounds("FLOOR1_6", FLOOR, 64, "laundry_machine1_amb_(hell)", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        addFlatSounds("FLOOR6_1", CEILING, 64, "laundry_machine1_amb_(hell)", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        addFlatSounds("FLOOR1_6", CEILING, 64, "laundry_machine1_amb_(hell)", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        addFlatSounds("REDWALL", FLOOR, 64, "laundry_machine1_amb_(hell)", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        addFlatSounds("REDWALL1", FLOOR, 64, "laundry_machine1_amb_(hell)", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        addFlatSounds("REDWALL", CEILING, 64, "laundry_machine1_amb_(hell)", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        addFlatSounds("REDWALL1", CEILING, 64, "laundry_machine1_amb_(hell)", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        addFlatSounds("FLAT5_3", CEILING, 64, "laundry_machine1_amb_(hell)", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        addFlatSounds("FLAT5_3", FLOOR, 64, "laundry_machine1_amb_(hell)", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
        // Hell

        // sky------------sky------------sky------------sky------------sky------------sky------------sky------------
		//addFlatSounds("F_SKY1", CEILING, 128, "windgust_strong", CHANF_LISTENERZ | CHANF_LOOPING, (0.2 * fVolMult.GetFloat())); // works but messyt
		addFlatSounds("F_SKY1", CEILING, 128, "windgust_strong", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
		addFlatSounds("F_SKY2", CEILING, 128, "wind_med2", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
		addFlatSounds("F_SKY3", CEILING, 128, "windgust_strong", CHANF_LISTENERZ | CHANF_LOOPING, 0.2);
		addFlatSounds("F_SKY4", CEILING, 128, "windmill_wind_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        // sky------------sky------------sky------------sky------------sky------------sky------------
        
        // flats------------


        // Blue tech -walls would be better replacement
	    addFlatSounds("FLAT14", FLOOR, 64, "field_loop1", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP, 0.5);
	    addFlatSounds("FLOOR1_1", FLOOR, 64, "field_loop1", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP, 0.5);
	    addFlatSounds("CEIL4_1", CEILING, 64, "field_loop1", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP, 0.5);
	    addFlatSounds("CEIL4_2", CEILING, 64, "field_loop1", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP, 0.5);
	    addFlatSounds("CEIL4_3", CEILING, 64, "field_loop1", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP, 0.5);
	    addFlatSounds("FLAT22", CEILING, 64, "portal_beam_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.5);
        // Blue tech

        // Portals -bad
        /*
        addFlatSounds("GATE1", FLOOR, 64, "extract_loop1_(portal)", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("GATE2", FLOOR, 64, "extract_loop1_(portal)", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("GATE3", FLOOR, 64, "extract_loop1_(portal)", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("GATE4", FLOOR, 64, "extract_loop1_(portal)", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        */
        // portals


        // marble -sexy
        addFlatSounds("DEM1_5", FLOOR, 64, "ambience5", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("DEM1_6", FLOOR, 64, "ambience5", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("FLOOR7_2", FLOOR, 64, "ambience5", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        // marble

        // lights
        addFlatSounds("CEIL1_2", FLOOR, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("CEIL1_3", FLOOR, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("CEIL3_4", FLOOR, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        //-
        addFlatSounds("FLAT17", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("FLAT2", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("TLITE6_1", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("TLITE6_4", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("TLITE6_5", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("TLITE6_6", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("CEIL1_2", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("CEIL1_3", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("CEIL3_4", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("TLITE6_6", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("GRNLITE1", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("FLOOR1_7", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        addFlatSounds("CEIL3_6", CEILING, 64, "buzz", CHANF_LOOP | CHANF_NOSTOP | CHANF_OVERLAP);
        // lights

        // Caves 
	    addFlatSounds("GRNROCK", CEILING, 64, "cave_drip_edit", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
	    addFlatSounds("RROCK03", CEILING, 64, "cave_drip_edit", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
	    addFlatSounds("RROCK13", CEILING, 64, "cave_drip_edit", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
	    addFlatSounds("RROCK03", CEILING, 64, "cave_drip_edit", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
	    addFlatSounds("RROCK04", CEILING, 64, "cave_drip_edit", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
	    addFlatSounds("ROCK4", CEILING, 64, "cave_drip_edit", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
	    addFlatSounds("ROCK5", CEILING, 64, "cave_drip_edit", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
	    addFlatSounds("FLAT5_7", CEILING, 64, "cave_drip_edit", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
	    addFlatSounds("FLAT5_8", CEILING, 64, "cave_drip_edit", CHANF_LISTENERZ | CHANF_LOOPING, 0.3);
        // Caves

        // Generic ceilings - lazy
	    addFlatSounds("CEIL1_1", CEILING, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
	    addFlatSounds("CEIL3_1", CEILING, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
	    addFlatSounds("CEIL3_2", CEILING, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
	    addFlatSounds("CEIL3_3", CEILING, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
	    addFlatSounds("CEIL3_5", CEILING, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
	    addFlatSounds("CEIL5_1", CEILING, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
	    addFlatSounds("CEIL5_2", CEILING, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        // Generic ceilings

        // Generic floors lazy
        addFlatSounds("FLAT1", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT1_1", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT1_2", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT1_3", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT3", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT4", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT5", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT8", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT0_1", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT0_2", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT0_3", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT0_5", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT0_6", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT0_7", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT5_4", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("MFLR8_1", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("MFLR8_2", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        //hexa metal
        addFlatSounds("FLAT4_8", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT5_1", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT5_2", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT5_3", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        //hexa brown
        //wood
        addFlatSounds("FLAT5_1", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT5_2", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        //wood
        //stone
        addFlatSounds("FLAT5_7", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("FLAT5_8", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("GRNROCK", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        //stone
        // hell generic
        addFlatSounds("MFLR8_3", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        addFlatSounds("MFLR8_4", FLOOR, 64, "underground_hall_loop1", CHANF_LISTENERZ | CHANF_LOOPING, 0.1);
        // hell generic
        // Generic floors

        // flats------------


        



	}
	
	// returns area of sector (irregular polygon)
	float polygonArea(Sector sec)
	{
		Array<float> lineAreas;
		for (int i = 0; i < sec.Lines.Size(); i++)
		{
			int v1x = int(sec.Lines[i].V1.P.x);
			int v1y = int(sec.Lines[i].V1.P.y);

			int v2x = int(sec.Lines[i].V2.P.x);
			int v2y = int(sec.Lines[i].V2.P.y);

			float avgY = (v1y + v2y) * 0.5 * .015625;
			float widthX = (v2x - v1x) * .015625;
			lineAreas.Push(avgY * widthX);
		}
		float totArea;
		for (int i = 0; i < lineAreas.Size(); i++)
		{
			totArea += lineAreas[i];
		}
		return totArea;
	}
	
	// add idle ambient sounds
	override void WorldLoaded(WorldEvent e)
	{
		LoadArrays();
		int FLOOR = 0;
		int CEILING = 1;
		TexMan texture;

		for(int i = 0; i < Level.Sectors.Size(); i++)
		{
			textureid floorid = Level.Sectors[i].GetTexture(FLOOR);
			textureid ceilingid = Level.Sectors[i].GetTexture(CEILING);

			SecPlane ceilingplane = Level.Sectors[i].CeilingPlane;
			SecPlane floorplane = Level.Sectors[i].FloorPlane;

			int ceilingZ = int(ceilingplane.ZAtPoint((Level.Sectors[i].CenterSpot.x, Level.Sectors[i].CenterSpot.y)));
			int floorZ = int(floorplane.ZAtPoint((Level.Sectors[i].CenterSpot.x, Level.Sectors[i].CenterSpot.y)));
			int centerheight = ceilingZ - floorZ;

			for (int ii = 0; ii < fCounter; ii++)
			{
				string flat = FlatSounds[ii].type == CEILING ? texture.GetName(ceilingid) : texture.GetName(floorid);
				if (FlatSounds[ii].fname == flat && centerheight > FlatSounds[ii].height)
				{
					float pArea = polygonArea(Level.Sectors[i]);
                     // pAreaMin is local cvar, uniamb__pAreaMin is cvarinfo/menudef one
                     CVar pAreaMin = CVar.FindCVar('uniamb_pAreaMin'); //has to be defined in the same function its used
                    // pArea 64 by default, 4 can overlap in map02, 0 can earrape on stairs
					if (pArea > pAreaMin.GetInt()) // > pAreaMin.GetInt() was > 4
					{
                        //console.printf("%d", pAreaMin.GetInt()); // pArea call debug
						// console.printf("Adding %s to %s", FlatSounds[ii].sname, FlatSounds[ii].fname);
						vector3 v3 = (Level.Sectors[i].CenterSpot.x, Level.Sectors[i].CenterSpot.y, floorZ);
						Actor ptr = Actor.Spawn("IA_Sound", v3);
						if (ptr)
						{
							// console.printf(ptr.getSpecies()); //debug
                            // fVolymult is local cvar, uniamb_fvol is cvarinfo/menudef one
                            CVar fVolMult = CVar.FindCVar('uniamb_fVol'); //has to be defined in the same function its used
                            //console.printf("%f", fVolMult.GetFloat()); //debug
							ptr.A_StartSound(FlatSounds[ii].sname, CHAN_AUTO, FlatSounds[ii].flags, (FlatSounds[ii].volume * fVolMult.GetFloat()));
						}
					}
					break;
				}
			}
		}
	}
// ITEMS------------- ITEMS-------------ITEMS-------------

	override void WorldThingSpawned(WorldEvent e)
	{
		if (e.thing)
		{
			for (int i = 0; i < iCounter; i++)
			{
				if (ItemSounds[i].cname == e.thing.GetSpecies())
				{
					// console.printf("Adding %s to %s", ItemSounds[i].sname, ItemSounds[i].cname);
					Actor ptr = e.thing.Spawn("IA_Sound", e.thing.pos);
					if (ptr)
					{
						// console.printf(ptr.getSpecies());
						ptr.A_StartSound(ItemSounds[i].sname, CHAN_AUTO, ItemSounds[i].flags, ItemSounds[i].volume);
					}
				}
				break;
			}
		}
	}

// ITEMS------------- ITEMS-------------ITEMS-------------
// options menu attempt

//class UniversalAmbience_OptionMenu : OptionMenu {

	//override void Init(Menu parent, OptionMenuDescriptor desc) {
		//super.Init(parent, desc);
		//DontDim = true;
		//DontBlur = true;
	//}

}

class UniversalAmbience_OptionMenu : OptionMenu
{
	override void Init(Menu parent, OptionMenuDescriptor desc)
	{
		super.Init(parent, desc);
		DontDim = true;
		DontBlur = true;
	}
}

