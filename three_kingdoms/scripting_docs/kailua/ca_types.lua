------- Three Kingdoms Kailua Types

--[[
This file's purpose is to define functions made by Creative Assembly for Three Kingdoms. Each function comes with a quick usage explanation.

To submit new functions, contact Vandy in the Modding Den. Just let him know the function name and where it is, and he'll take care of it.


--]]

--[[
*************
GLOBAL OBJECTS
*************

These are all the definitions of CA objects or managers. Their individual usages are detailed below.

--]]

-- CORE, available in all game modes
--# assume global class CA_CORE

-- Campaign managers 
--# assume global class CA_CM
--# assume global class CA_CUIM

-- Battle manager
--# assume global class CA_BM

--# assume global class CA_WORLD_MODIFY

--# assume global class CA_MODEL_MODIFY
--# assume global class CA_MODEL_QUERY

--# assume global class CA_CEO_MANAGER_MODIFY
--# assume global class CA_CEO_MANAGER_QUERY

--# assume global class CA_FACTION_MODIFY
--# assume global class CA_FACTION_QUERY
--# assume global class CA_FACTION_QUERY_LIST

--# assume global class CA_CHARACTER_MODIFY
--# assume global class CA_CHARACTER_QUERY
--# assume global class CA_CHARACTER_QUERY_LIST

--# assume global class CA_HISTORICAL_CHARACTER_QUERY
--# assume global class CA_HISTORICAL_CHARACTER_QUERY_LIST
--# assume global class CA_HISTORICAL_CHARACTER_QUERY_MANAGER

--# assume global class CA_FAMILY_MEMBER_MODIFY
--# assume global class CA_FAMILY_MEMBER_QUERY

--# assume global class CA_MILITARY_FORCE_MODIFY
--# assume global class CA_MILITARY_FORCE_QUERY
--# assume global class CA_MILITARY_FORCE_QUERY_LIST

--# assume global class CA_UNIT_MODIFY
--# assume global class CA_UNIT_QUERY
--# assume global class CA_UNIT_QUERY_LIST

--# assume global class CA_FACTION_PROVINCE_MODIFY
--# assume global class CA_FACTION_PROVINCE_QUERY
--# assume global class CA_FACTION_PROVINCE_QUERY_LIST

--# assume global class CA_PROVINCE_MODIFY
--# assume global class CA_PROVINCE_QUERY
--# assume global class CA_PROVINCE_QUERY_LIST

--# assume global class CA_REGION_MANAGER_MODIFY

--# assume global class CA_REGION_MODIFY
--# assume global class CA_REGION_QUERY
--# assume global class CA_REGION_QUERY_LIST
--# assume global class CA_REGION_QUERY_MANAGER

--# assume global class CA_SETTLEMENT_MODIFY
--# assume global class CA_SETTLEMENT_QUERY

--# assume global class CA_GARRISON_RESIDENCE_MODIFY
--# assume global class CA_GARRISON_RESIDENCE_QUERY

--# assume global class CA_SLOT_MODIFY
--# assume global class CA_SLOT_QUERY
--# assume global class CA_SLOT_QUERY_LIST

--# assume global class CA_BUILDING_QUERY_LIST
--# assume global class CA_BUILDING_QUERY
--# assume global class CA_BUILDING_MODIFY

--# assume global class CA_CAMPAIGN_AI_MODIFY
--# assume global class CA_CAMPAIGN_AI_QUERY

--# assume global class CA_PENDING_BATTLE_MODIFY
--# assume global class CA_PENDING_BATTLE_QUERY

--# assume global class CA_EPISODIC_SCRIPTING_QUERY
--# assume global class CA_EPISODIC_SCRIPTING_MODIFY

--# assume global class CA_POOLED_REOSURCE_QUERY
--# assume global class CA_POOLED_RESOURCE_MODIFY

--# assume global class CA_UIC
--# assume global class CA_CQI



--[[
************
CAMPAIGN MANAGER

This is one of the main objects, accessible by using "cm:" followed by the function's name, for instance "cm:faction_exists(key)".
************
--]]

------ HELPERS
-- random number, max/min
--# assume CA_CM.random_number: method(max_num: number | integer, min_num: number | integer) --> (number | integer)

------ GETTING MODEL

-- grab the query model object
--# assume CA_CM.query_model: method() --> CA_MODEL_QUERY

-- grab the modify model object
--# assume CA_CM.modify_model: method() --> CA_MODEL_MODIFY

------ CALLBACK FUNCTIONS

-- add a first tick callback, which is run every campaign load - post battle, initial load, initial creation, etc.,
--# assume CA_CM.add_first_tick_callback:method(callback: function, key: string?)

------ GETTING FACTIONS

-- check to see if a faction exists on the map.
-- faction_key: found in factions_tables
--# assume CA_CM.faction_exists: method(faction_key: string) --> boolean

-- Grab the query faction object for a faction with faction_key. Used to read details about a faction.
---- faction_key: found in factions_tables
---- assert_on_failure: output errors to script log (optional)
--# assume CA_CM.query_faction: method(faction_key: string, assert_on_failure: bool?) --> CA_FACTION_QUERY

-- Getter for the query faction object, via CQI. Used to read details about the faction.
---- cqi: Command Queue Index of the faction.
---- assert_on_failure: output errors to script log (optional)
--# assume CA_CM.query_faction_by_cqi: method(cqi: CA_CQI, assert_on_failure: bool?) --> CA_FACTION_QUERY

-- Getter for the modify faction object. Used to edit or apply changes to the faction.
---- faction_key: found in factions_tables
---- assert_on_failure: output errors to script log (optional)
--# assume CA_CM.modify_faction: method(object: string | CA_FACTION_QUERY, assert_on_failure: bool?) --> CA_FACTION_MODIFY

-- Getter for the local player's query faction object. Used to read details about the faction.
---- force: force the usage of this command, making it work for multiplayer
--# assume CA_CM.query_local_faction: method(force: boolean)

-- Getter for the local player's modify faction object. Used to edit or apply changes to the faction.
---- force: force the usage of this command, making it work for multiplayer
--# assume CA_CM.modify_local_faction: method(force: boolean)

-- Getter for the local player's faction key.
---- force: force the usage of this command, making it work for multiplayer
--# assume CA_CM.get_local_faction: method(force: boolean)

-- Getter for all human player faction keys.
--# assume CA_CM.get_human_factions: method() --> vector<string>

------ GETTING REGIONS

-- Check to see if region exists
---- region_key: found in regions_tables [[TODO: verify]]
--# assume CA_CM.region_exists: method(region_key: string) --> boolean

-- Getter for the query region object
---- region_key: [[ditto]]
---- exists: check to see if the region exists. Same usage as above function
--# assume CA_CM.query_region: method(region_key: string, exists: boolean) --> (CA_REGION_QUERY | boolean)

-- Getter for the modify region object
---- region: either the key of the region, or a query region object
--# assume CA_CM.modify_region: method(region: string | CA_REGION_QUERY) --> CA_REGION_MODIFY

------ GETTING SETTLEMENTS

-- Getter for the query settlement object
---- region_key: [[ditto up two]]
--# assume CA_CM.query_settlement: method(region_key: string) --> CA_SETTLEMENT_QUERY

-- Getter for the modify settlement object
---- region: either the key of the region, or a query settlement objecg
--# assume CA_CM.modify_settlement: method(region: string | CA_SETTLEMENT_QUERY) --> CA_SETTLEMENT_MODIFY

------ GETTING CHARACTERS

-- Getter for a character query object
---- cqi: the command queue index of the character. Can be string or number, as long as the string is just the CQI in quotes
--# assume CA_CM.query_character: method(cqi: number | string | CA_CQI) --> CA_CHARACTER_QUERY

-- Getter for a character modify object
---- obj: can be the command queue index of the character, or a character query object
--# assume CA_CM.modify_character: method(obj: number | string | CA_CQI | CA_CHARACTER_QUERY) --> CA_CHARACTER_MODIFY

------ GETTING MILITARY FORCES

-- Getter for a military force query obj
---- cqi: command queue index of the character
--# assume CA_CM.query_military_force: method(cqi: number | string | CA_CQI) --> CA_MILITARY_FORCE_QUERY

-- Getter for a military force modify obj
---- obj: can be a command queue object of the character, or a military force query object
--# assume CA_CM.modify_military_force: method(obj: number | string | CA_CQI | CA_MILITARY_FORCE_QUERY) --> CA_MILITARY_FORCE_MODIFY

------ GETTING CAMPAIGN AI

-- Getter for the campaign AI query obj
--# assume CA_CM.query_campaign_ai: method() --> CA_CAMPAIGN_AI_QUERY

-- Getter for the campain AI modify obj
--# assume CA_CM.modify_campaign_ai: method() --> CA_CAMPAIGN_AI_MODIFY

------ GETTING MANAGERS
-- Getter for the campaign UI manager
--# assume CA_CM.get_campaign_ui_manager: method() --> CA_CUIM

------ CAMPAIGN DETAILS

-- Read if modify objects are allowed at the moment
--# assume CA_CM.can_modify: method() --> boolean

-- Read the current campaign name
--# assume CA_CM.get_campaign_name: method() --> string

--# assume CA_CM.query_scripting: method() --> CA_EPISODIC_SCRIPTING_QUERY

--# assume CA_CM.modify_scripting: method() --> CA_EPISODIC_SCRIPTING_MODIFY

--[[
************
CORE
************
--]]

-- Getter for the UI root object, which is the initial handle for all UI components
--assume CA_CORE.get_ui_root: method() --> CA_UIC

-- Check if the UI has finished being initialized. Good checkpoint to read for before making changes to game and model
--# assume CA_CORE.is_ui_created: method() --> boolean

-- Set a function to trigger on UI Created
--# assume CA_CORE.add_ui_created_callback: method(callback: function)

-- Set a function to trigger on UI Destroyed
--# assume CA_CORE.add_ui_destroyed_callback: method(callback: function)

-- Read if the game mode is campaign
--# assume CA_CORE.is_campaign: method() --> boolean

-- Read if the game mode is battle
--# assume CA_CORE.is_battle: method() --> boolean

-- Read if the game mode is frontend
--# assume CA_CORE.is_frontend: method() --> boolean

--# assume CA_CORE.add_listener: method(
--# unique_id: string, 
--# event: string, 
--# conditional: boolean, 
--# callback: function(context: WHATEVER), 
--# persistent: boolean)

-- Save a boolean to the current session, which will persist between game modes, but will be lost when the game is closed
---- name: the unique identifier for this boolean, to find later
---- value: true/false value
--# assume CA_CORE.svr_save_bool: method(name: string, value: boolean)

--[[
************
QUERY MODEL
************
--]]

--# assume CA_MODEL_QUERY.is_multiplayer: method() --> boolean
--# assume CA_MODEL_QUERY.is_player_turn: method() --> boolean
--# assume CA_MODEL_QUERY.turn_number: method() --> number


-- get campaign mode, "historical" or [[TODO]]
--# assume CA_MODEL_QUERY.campaign_game_mode: method() --> string

--# assume CA_MODEL_QUERY.episodic_scripting: method() --> CA_EPISODIC_SCRIPTING_QUERY

--# assume CA_MODEL_QUERY.pending_battle: method() --> CA_PENDING_BATTLE_QUERY

--[[ FOUND
    has_faction_command_queue_index
    event_generator_interface
    has_character_command_queue_index
    unit_scale_multiplier
    campaign_type
    historical_character_manager
    region_slot_for_command_queue_index
    character_for_startpos_id
    character_can_reach_character
    military_force_for_command_queue_index
    new
    world
    campaign_ai
    calendar_year
    character_for_command_queue_index
    faction_for_command_queue_index
    has_military_force_command_queue_index
    local_faction
    campaign_name
    date_and_week_in_range
    difficulty_level
    is_benchmark_mode
    is_null_interface
    date_in_range
]]

--[[
************
MODIFY MODEL
************
--]]

--# assume CA_MODEL_MODIFY.get_modify_episodic_scripting: method() --> CA_EPISODIC_SCRIPTING_MODIFY
--# assume CA_MODEL_MODIFY.get_modify_pooled_resource: method(key: string) --> CA_POOLED_RESOURCE_MODIFY
--# assume CA_MODEL_MODIFY.get_modify_character: method(query_char: CA_CHARACTER_QUERY)

--# assume CA_MODEL_MODIFY.query_model: method() --> CA_MODEL_QUERY

--[[ FOUND
    get_modify_campaign_ai
    get_modify_pooled_resource_manager
    get_modify_unit
    enable_diplomacy
    random_percentage
    get_modify_region
    get_modify_garrison_residence
    get_modify_character_ceo_management
    get_modify_military_force_horde_details
    get_modify_military_force
    get_modify_faction_ceo_management
    get_modify_settlement
    get_modify_military_force_slot
    get_modify_slot
    get_modify_mission
    set_end_turn_notification_suppressed
    new
    force_civil_war
    disable_diplomacy
    get_modify_undercover_character_manager
    get_modify_mission_by_cqi
    get_modify_region_manager
    get_modify_pending_battle
    get_modify_undercover_character
    get_modify_world
    get_modify_faction
    is_null_interface
    get_modify_building
    random_number
    get_modify_military_force_building
    get_modify_family_member
]]
--[[
************
QUERY FACTION
************
--]]

---- SELF OBJECTS

--# assume CA_FACTION_QUERY.faction_leader: method() --> CA_CHARACTER_QUERY
--# assume CA_FACTION_QUERY.faction_province_list: method() --> CA_FACTION_PROVINCE_QUERY_LIST
--# assume CA_FACTION_QUERY.capital_region: method() --> CA_REGION_QUERY
--# assume CA_FACTION_QUERY.region_list: method() --> CA_REGION_QUERY_LIST
--# assume CA_FACTION_QUERY.character_list: method() --> CA_CHARACTER_QUERY_LIST

---- DETAILS

--# assume CA_FACTION_QUERY.subculture: method() --> string
--# assume CA_FACTION_QUERY.has_faction_leader: method() --> boolean
--# assume CA_FACTION_QUERY.maximum_characters_in_recruitment_pool: method() --> number 
--# assume CA_FACTION_QUERY.has_capital_region: method() --> boolean
--# assume CA_FACTION_QUERY.holds_entire_province: method(province_key: string, include_vassals: boolean) --> boolean

--# assume CA_FACTION_QUERY.has_technology: method(technology_key: string) --> boolean

---- MANAGERS

--# assume CA_FACTION_QUERY.ceo_management: method() --> CA_CEO_MANAGER_QUERY

-- FOUND
--[[
    num_allies
    factions_met
    treasury_percent

    trade_ship_not_in_trade_node
    number_of_factions_we_have_specified_diplomatic_deal_with

    losing_money
    pooled_resources
    at_war_with
    upkeep_expenditure_percent
    undercover_character_manager
    factions_trading_with
    at_war
    factions_we_have_specified_diplomatic_deal_with
    unused_international_trade_route
    is_quest_battle_faction
    military_force_list
    tax_level
    name
    model
    is_dead
    is_null_interface
    command_queue_index
    research_queue_idle
    trade_resource_exists
    progression_level
    factions_at_war_with
    num_generals
    is_at_civil_war
    number_of_world_leader_regions
    can_apply_automatic_diplomatic_deal
    trade_value
    has_specified_diplomatic_deal_with
    new
    culture
    is_horde
    state_religion
    number_of_employed_characters
    number_of_characters_in_recruitment_pool
    is_human
    foreign_undercover_characters_in_faction
    factions_of_same_culture
    allied_with
    treasury
    is_world_leader
    is_vassal
    factions_of_same_subculture
    has_food_shortage
    is_ally_vassal_or_client_state_of
    character_posts
]]

--[[
************
MODIFY FACTION
************
--]]

--[[ FOUND 
    begin_tech_research
    create_recruitable_character_from_template
    lock_technology
    trigger_incident
    trigger_dilemma
    apply_automatic_diplomatic_deal
    make_region_capital
    add_event_restricted_unit_record
    add_event_restricted_building_record
    create_character_from_template
    trigger_custom_mission_from_string
    remove_effect_bundle
    create_character
    increase_treasury
    create_force
    create_force_with_existing_general
    disable_movement
    model
    unlock_technology
    add_event_restrict_all_units
    create_agent
    apply_effect_bundle
    create_character_with_subtype
    create_recruitable_character_with_gender
    cancel_custom_mission
    show_message_event_located
    remove_event_restrict_all_units
    unlock_starting_general_recruitment
    remove_event_restricted_building_record
    get_map_pins_handler
    create_recruitable_character_with_subtype
    new
    create_character_with_gender
    create_recruitable_character
    show_message_event
    trigger_custom_mission
    enable_diplomacy
    lock_starting_general_recruitment
    enable_movement
    disable_diplomacy
    ceo_management
    is_null_interface
    make_region_visible_in_shroud
    trigger_mission
    make_region_seen_in_shroud
    query_faction
    create_force_with_general
    remove_event_restricted_unit_record
--]]

--[[
************
QUERY REGION
************
--]]

-- Getter for the query settlement attached to this region.
--# assume CA_REGION_QUERY.settlement: method() --> CA_SETTLEMENT_QUERY

--[[ FOUND
    command_queue_index
    is_null_interface
    resource_exists
    pooled_resources
    settlement
    can_recruit_agent_at_settlement
    has_development_points_to_upgrade
    slot_list
    adjacent_region_list
    num_buildings
    governor
    is_province_capital
    last_building_constructed_key
    building_superchain_exists
    region_wealth_change_percent
    new
    sanitation
    slot_type_exists
    building_exists
    garrison_residence
    has_governor
    faction_province_growth_per_turn
    squalor
    is_abandoned
    owning_faction
    faction_province_growth
    name
    model
    majority_religion
    public_order
    province_name
    religion_proportion
]]

--[[
************
MODIFY REGION
************
--]]

--[[ FOUND
    remove_effect_bundle
    model
    query_region
    apply_effect_bundle
    is_null_interface
    new
]]

--[[
************
QUERY SETTLEMENT
************
--]]

-- Get the display pos x of the settlement
--# assume CA_SETTLEMENT_QUERY.display_position_x: method() --> number

-- Get the display pos y of the settlement
--# assume CA_SETTLEMENT_QUERY.display_position_y: method() --> number

--[[ FOUND

    is_port
    region
    logical_position_y
    has_commander
    slot_list
    display_position_y
    display_position_x
    faction
    model
    logical_position_x
    commander
    is_null_interface
    new

]]

--[[
************   
    MODIFY SETTLEMENT
************
--]]

--[[ FOUND
    query_settlement
    model
    is_null_interface
    new
]]

--[[
************
QUERY CHARACTER
************
--]]

-- Check if the character has an attached military force
--# assume CA_CHARACTER_QUERY.has_military_force: method() --> boolean

-- Get the character's attached military force, query object
--# assume CA_CHARACTER_QUERY.military_force: method() --> CA_MILITARY_FORCE_QUERY

--[[ FOUND
    gravitas
    offensive_battles_fought
    battles_won
    commanded_resistent_retinue_slot
    character_subtype_key
    defensive_naval_battles_fought
    offensive_naval_battles_won
    action_points_remaining_percent
    defensive_sieges_won
    offensive_ambush_battles_fought
    age
    offensive_sieges_fought
    garrison_residence
    is_caster
    get_surname
    is_blockading
    commanded_military_force_retinue
    performed_action_this_turn
    offensive_naval_battles_fought
    military_force
    has_undercover_character_enabler
    get_max_attribute_value
    has_garrison_residence
    has_father
    turns_in_enemy_regions
    logical_position_x
    is_faction_leader
    commanded_persistent_retinue
    ceo_management
    logical_position_y
    offensive_ambush_battles_won
    character_type
    in_port
    faction
    battles_fought
    defensive_naval_battles_won
    is_male
    has_region
    get_min_attribute_value
    get_forename
    body_guard_casulties
    offensive_sieges_won
    turns_in_own_regions
    get_current_attribute_value
    has_mother
    offensive_battles_won
    is_politician
    active_assignment
    post_battle_ceo_chance
    display_position_y
    character_post
    undercover_character_links
    startpos_key
    is_besieging
    generation_template_key
    latest_wound_death_type
    turns_at_sea
    is_character_is_faction_recruitment_pool
    has_military_force
    owned_persistent_retinue
    routed_in_battle
    model
    is_dead
    is_null_interface
    is_at_sea
    command_queue_index
    is_spy
    is_wounded
    is_visible_to_faction
    defensive_ambush_battles_fought
    cqi
    family_member
    mother
    in_settlement
    is_ambushing
    is_embedded_in_military_force
    relationships
    defensive_battles_fought
    character_subtype
    fought_in_battle
    loyalty
    new
    defensive_ambush_battles_won
    commanded_military_force_retinue_slot
    action_points_per_turn
    has_skill
    has_recruited_mercenaries
    defensive_battles_won
    is_deployed
    is_hidden
    won_battle
    father
    region
    is_carrying_troops
    display_position_x
    defensive_sieges_fought
    percentage_of_own_alliance_killed
    rank
]]

--[[
************
    MODIFY CHARACTER
************
--]]

--[[ FOUND

    attack_settlement
    kill_character
    attack_garrison
    apply_relationship_trigger_set
    wound_character
    set_undercover_character_enabler
    query_character
    zero_action_points
    new
    replenish_action_points
    ceo_management
    teleport_to
    enable_movement
    set_character_unique
    add_loyalty_effect
    disable_movement
    reset_skills
    model
    add_experience
    walk_to
    is_null_interface
    attack

]]

--[[
************
    EPISODIC SCRIPTING QUERY
************    
--]]


--[[
************
    EPISODIC SCRIPTING MODIFY
************    
--]]

--# assume CA_EPISODIC_SCRIPTING_MODIFY.filesystem_lookup: method(file_path: string, file_name: string) --> string

--# assume global get_cm: function()  --> CA_CM
--# assume global get_events: function() --> nil

--# assume global cm: CA_CM
--# assume global core: CA_CORE



--interfaces: 

--# assume global class NULL_SCRIPT_INTERFACE

--# assume global class MODIFY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE
--# assume global class MODIFY_REGION_SCRIPT_INTERFACE
--# assume global class MODIFY_MODEL_SCRIPT_INTERFACE
--# assume global class MODIFY_POOLED_RESOURCE_SCRIPT_INTERFACE
--# assume global class MODIFY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE


--# assume global class CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE


--# assume global class QUERY_DIPLOMACY_PROPOSED_COMPONENT_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_BUILDING_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_REGION_SCRIPT_INTERFACE
--# assume global class QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE
--# assume global class MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume global class MODIFY_CAMPAIGN_MISSION_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_ALLIANCE_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE
--# assume global class MODIFY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume global class QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume global class MODIFY_SLOT_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_CHARACTER_ASSIGNMENT_SCRIPT_INTERFACE
--# assume global class MODIFY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume global class QUERY_CHARACTER_POST_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_FACTION_PROVINCE_LIST_SCRIPT_INTERFACE
--# assume global class MODIFY_REGION_MANAGER_SCRIPT_INTERFACE
--# assume global class MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_NEGOTIATED_DEAL_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_CHARACTER_RELATIONSHIP_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_CEO_EQUIPMENT_SLOT_LIST_SCRIPT_INTERFACE
--# assume global class MODIFY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE
--# assume global class QUERY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE
--# assume global class QUERY_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_NEGOTIATION_SCRIPT_INTERFACE
--# assume global class QUERY_UNDERCOVER_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE
--# assume global class QUERY_UNIT_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_DEAL_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_PROPOSED_COMPONENT_SCRIPT_INTERFACE
--# assume global class QUERY_MODEL_SCRIPT_INTERFACE
--# assume global class QUERY_REGION_MANAGER_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_DEAL_COMPONENT_SCRIPT_INTERFACE
--# assume global class QUERY_POOLED_RESOURCE_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_HISTORICAL_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume global class MODIFY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE
--# assume global class MODIFY_FACTION_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume global class QUERY_POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_HISTORICAL_CHARACTER_MANAGER_SCRIPT_INTERFACE
--# assume global class QUERY_PENDING_BATTLE_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_SLOT_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_CAMPAIGN_BATTLE_LOG_DUEL_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_DEAL_SCRIPT_INTERFACE
--# assume global class MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE
--# assume global class QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE
--# assume global class QUERY_CEO_LIST_SCRIPT_INTERFACE
--# assume global class MODIFY_SETTLEMENT_SCRIPT_INTERFACE
--# assume global class QUERY_WORLD_SCRIPT_INTERFACE
--# assume global class MODIFY_MAP_PINS_HANDLER_SCRIPT_INTERFACE
--# assume global class QUERY_PROVINCE_SCRIPT_INTERFACE
--# assume global class QUERY_PERSISTENT_RETINUE_SLOT_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_CEO_SCRIPT_INTERFACE
--# assume global class QUERY_SLOT_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_BUILDING_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume global class QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE
--# assume global class QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_RETINUE_SLOT_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_SCRIPT_INTERFACE
--# assume global class QUERY_UNIT_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE
--# assume global class QUERY_CAMPAIGN_MISSION_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_RETINUE_LIST_SCRIPT_INTERFACE
--# assume global class MODIFY_PROVINCE_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_NEGOTIATED_DEALS_SCRIPT_INTERFACE
--# assume global class QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume global class QUERY_SLOT_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE
--# assume global class QUERY_BUILDING_LIST_SCRIPT_INTERFACE
--# assume global class MODIFY_FACTION_PROVINCE_SCRIPT_INTERFACE
--# assume global class QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE
--# assume global class QUERY_PERSISTENT_RETINUE_SLOT_RECRUITMENT_SCRIPT_INTERFACE
--# assume global class MODIFY_WORLD_SCRIPT_INTERFACE
--# assume global class QUERY_FACTION_PROVINCE_SCRIPT_INTERFACE
--# assume global class QUERY_PROVINCE_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE
--# assume global class QUERY_CAMPAIGN_BATTLE_LOG_DUEL_SCRIPT_INTERFACE
--# assume global class MODIFY_PENDING_BATTLE_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE
--# assume global class MODIFY_BUILDING_SCRIPT_INTERFACE
--# assume global class QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume global class QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume global class QUERY_FACTION_SCRIPT_INTERFACE
--# assume global class QUERY_REGION_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_CHARACTER_RELATIONSHIP_SCRIPT_INTERFACE
--# assume global class QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE
--# assume global class QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE
--# assume global class QUERY_SETTLEMENT_SCRIPT_INTERFACE
--# assume global class QUERY_CHARACTER_POST_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_ALLIANCE_SCRIPT_INTERFACE
--# assume global class QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume global class QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume global class MODIFY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE
--# assume global class MODIFY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE
--# assume global class MODIFY_GARRISON_RESIDENCE_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_DEAL_COMPONENT_LIST_SCRIPT_INTERFACE
--# assume global class MODIFY_CHARACTER_SCRIPT_INTERFACE
--# assume global class MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume global class QUERY_DIPLOMACY_NEGOTIATED_DEAL_SCRIPT_INTERFACE
--# assume global class MODIFY_UNIT_SCRIPT_INTERFACE
--# assume global class QUERY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE


--Methods: 
-- MODIFY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE
--# assume MODIFY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE.query_military_force_horde_details: method() --> QUERY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE
--# assume MODIFY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- MODIFY_REGION_SCRIPT_INTERFACE
--# assume MODIFY_REGION_SCRIPT_INTERFACE.remove_effect_bundle: method(effect_bundle: string)
--# assume MODIFY_REGION_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
--# assume MODIFY_REGION_SCRIPT_INTERFACE.apply_effect_bundle: method(effect_bundle: string, turns: number)
--# assume MODIFY_REGION_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_REGION_SCRIPT_INTERFACE.query_region: method() --> QUERY_REGION_SCRIPT_INTERFACE

-- MODIFY_MODEL_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.query_model: method() --> QUERY_MODEL_SCRIPT_INTERFACE

--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_episodic_scripting: method() --> MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_world: method() --> MODIFY_WORLD_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_faction: method(QUERY_FACTION_SCRIPT_INTERFACE) --> MODIFY_FACTION_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_character: method(QUERY_CHARACTER_SCRIPT_INTERFACE) --> MODIFY_CHARACTER_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_region_manager: method() --> MODIFY_REGION_MANAGER_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_region: method(QUERY_REGION_SCRIPT_INTERFACE) --> MODIFY_REGION_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_garrison_residence: method(QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE) --> MODIFY_GARRISON_RESIDENCE_SCRIPT_INTERFACE

--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_pooled_resource: method(QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE) --> MODIFY_POOLED_RESOURCE_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_campaign_ai: method(QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE) --> MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_pooled_resource_manager: method(QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE) --> MODIFY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_unit: method(QUERY_UNIT_SCRIPT_INTERFACE) --> MODIFY_UNIT_SCRIPT_INTERFACE


--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_pending_battle: method() --> MODIFY_PENDING_BATTLE_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_military_force_horde_details: method(QUERY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE) --> MODIFY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_faction_ceo_management: method( QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE ) --> MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_settlement: method( QUERY_SETTLEMENT_SCRIPT_INTERFACE ) --> MODIFY_SETTLEMENT_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_military_force_slot: method( QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE ) --> MODIFY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_slot: method( QUERY_SLOT_SCRIPT_INTERFACE ) --> MODIFY_SLOT_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_undercover_character_manager: method(QUERY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE) --> MODIFY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE

--# assume MODIFY_MODEL_SCRIPT_INTERFACE.set_end_turn_notification_suppressed: method(notification_key: string, suppress: boolean)
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.force_civil_war: method(instigator: QUERY_CHARACTER_SCRIPT_INTERFACE)
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.disable_diplomacy: method(proposer_filter: string, recipient_filter: string, component_keys: string, reason_key: string)
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_mission_by_cqi: method(cqi: CA_CQI | number | int) --> MODIFY_CAMPAIGN_MISSION_SCRIPT_INTERFACE

--# assume MODIFY_MODEL_SCRIPT_INTERFACE.random_number: method( min_value: number | int, max_value: number | int) --> number
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.enable_diplomacy: method(proposer_filter: string, recipient_filter: string, component_keys: string, reason_key: string)
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.random_percentage: method()

--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_undercover_character: method(QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE) --> MODIFY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE

--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_mission: method(QUERY_CAMPAIGN_MISSION_SCRIPT_INTERFACE) --> MODIFY_CAMPAIGN_MISSION_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_character_ceo_management: method(QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE) --> MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE

--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_building: method( QUERY_BUILDING_SCRIPT_INTERFACE ) --> MODIFY_BUILDING_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_family_member: method( QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE ) --> MODIFY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_military_force_building: method( QUERY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE ) --> MODIFY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE
--# assume MODIFY_MODEL_SCRIPT_INTERFACE.get_modify_military_force: method( QUERY_MILITARY_FORCE_SCRIPT_INTERFACE ) --> MODIFY_MILITARY_FORCE_SCRIPT_INTERFACE
-- QUERY_DIPLOMACY_PROPOSED_COMPONENT_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_PROPOSED_COMPONENT_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_DIPLOMACY_PROPOSED_COMPONENT_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_PROPOSED_COMPONENT_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_DIPLOMACY_PROPOSED_COMPONENT_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- MODIFY_POOLED_RESOURCE_SCRIPT_INTERFACE
--# assume MODIFY_POOLED_RESOURCE_SCRIPT_INTERFACE.apply_transaction_to_factor: method(resource_factor_key: string, amount: number | int) --> number
--# assume MODIFY_POOLED_RESOURCE_SCRIPT_INTERFACE.query_pooled_resource: method() --> QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE
--# assume MODIFY_POOLED_RESOURCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_BUILDING_SCRIPT_INTERFACE
--# assume QUERY_BUILDING_SCRIPT_INTERFACE.superchain: method() --> string
--# assume QUERY_BUILDING_SCRIPT_INTERFACE.region: method() --> QUERY_REGION_SCRIPT_INTERFACE
--# assume QUERY_BUILDING_SCRIPT_INTERFACE.percent_health: method() --> number
--# assume QUERY_BUILDING_SCRIPT_INTERFACE.name: method() --> string
--# assume QUERY_BUILDING_SCRIPT_INTERFACE.faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_BUILDING_SCRIPT_INTERFACE.chain: method() --> string
--# assume QUERY_BUILDING_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_BUILDING_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_BUILDING_SCRIPT_INTERFACE.slot: method() --> QUERY_SLOT_SCRIPT_INTERFACE
-- CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.event_id: method() --> string
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.characters: method() --> QUERY_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.military_forces: method() --> QUERY_MILITARY_FORCE_LIST_SCRIPT_INTERFACE
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.regions: method() --> QUERY_REGION_LIST_SCRIPT_INTERFACE
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.add_character: method(character: QUERY_CHARACTER_SCRIPT_INTERFACE) --> number
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.add_military_force: method(QUERY_MILITARY_FORCE_SCRIPT_INTERFACE) --> number
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.add_faction: method(QUERY_FACTION_SCRIPT_INTERFACE) --> number
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.add_region: method(QUERY_REGION_SCRIPT_INTERFACE) --> number
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.set_id: method(id: string)
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.is_null_interface: method() --> boolean
--# assume CAMPAIGN_MODEL_SCRIPT_CALLBACK_INTERFACE.factions: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
-- QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_REGION_SCRIPT_INTERFACE
--# assume QUERY_REGION_SCRIPT_INTERFACE.resource_exists: method(resource: string) --> boolean
--# assume QUERY_REGION_SCRIPT_INTERFACE.settlement: method() --> QUERY_SETTLEMENT_SCRIPT_INTERFACE
--# assume QUERY_REGION_SCRIPT_INTERFACE.can_recruit_agent_at_settlement: method(agent_key: string) --> boolean
--# assume QUERY_REGION_SCRIPT_INTERFACE.has_development_points_to_upgrade: method() --> boolean
--# assume QUERY_REGION_SCRIPT_INTERFACE.slot_list: method() --> QUERY_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_REGION_SCRIPT_INTERFACE.adjacent_region_list: method() --> QUERY_REGION_LIST_SCRIPT_INTERFACE
--# assume QUERY_REGION_SCRIPT_INTERFACE.num_buildings: method() --> number
--# assume QUERY_REGION_SCRIPT_INTERFACE.is_province_capital: method() --> boolean
--# assume QUERY_REGION_SCRIPT_INTERFACE.last_building_constructed_key: method() --> string
--# assume QUERY_REGION_SCRIPT_INTERFACE.pooled_resources: method() --> QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_REGION_SCRIPT_INTERFACE.region_wealth_change_percent: method() --> number
--# assume QUERY_REGION_SCRIPT_INTERFACE.public_order: method() --> number
--# assume QUERY_REGION_SCRIPT_INTERFACE.sanitation: method() --> number
--# assume QUERY_REGION_SCRIPT_INTERFACE.slot_type_exists: method("rice:jap_awa:farm") --> boolean
--# assume QUERY_REGION_SCRIPT_INTERFACE.building_exists: method(building: string) --> boolean
--# assume QUERY_REGION_SCRIPT_INTERFACE.religion_proportion: method(religion_key: string) --> number
--# assume QUERY_REGION_SCRIPT_INTERFACE.majority_religion: method() --> string
--# assume QUERY_REGION_SCRIPT_INTERFACE.faction_province_growth_per_turn: method() --> number
--# assume QUERY_REGION_SCRIPT_INTERFACE.squalor: method() --> number
--# assume QUERY_REGION_SCRIPT_INTERFACE.is_abandoned: method() --> boolean
--# assume QUERY_REGION_SCRIPT_INTERFACE.owning_faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_REGION_SCRIPT_INTERFACE.faction_province_growth: method() --> number
--# assume QUERY_REGION_SCRIPT_INTERFACE.name: method() --> string
--# assume QUERY_REGION_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_REGION_SCRIPT_INTERFACE.province_name: method() --> string
--# assume QUERY_REGION_SCRIPT_INTERFACE.garrison_residence: method() --> QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE
--# assume QUERY_REGION_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_REGION_SCRIPT_INTERFACE.command_queue_index: method() --> number
-- MODIFY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE
--# assume MODIFY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.apply_source_faction_disown: method()
--# assume MODIFY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.apply_source_faction_recall: method()
--# assume MODIFY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.set_cover_points: method(cover_points: int)
-- NULL_SCRIPT_INTERFACE
--# assume NULL_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.position_x: method() --> number
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.loser_result: method() --> string
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.losing_characters: method() --> QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.round_fought: method() --> number
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.winning_characters: method() --> QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.winner_result: method() --> string
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.position_y: method() --> number
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.duels: method() --> QUERY_CAMPAIGN_BATTLE_LOG_DUEL_LIST_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.winning_factions: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CAMPAIGN_BATTLE_LOG_ENTRY_SCRIPT_INTERFACE.losing_factions: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
-- MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.add_scripted_permission: method(scripted_permission_key: string)
--# assume MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.remove_scripted_permission: method(scripted_permission_key: string)
--# assume MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.remove_ceos: method(ceo_data_key: string)
--# assume MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.apply_trigger: method(trigger_key: string)
--# assume MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.change_points_of_ceos: method(ceo_data_key: string, change_in_points: number | int)
--# assume MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.add_ceo: method(ceo_data_key: string)
--# assume MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.query_faction_ceo_management: method() --> QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE
-- MODIFY_CAMPAIGN_MISSION_SCRIPT_INTERFACE
--# assume MODIFY_CAMPAIGN_MISSION_SCRIPT_INTERFACE.cancel: method()
--# assume MODIFY_CAMPAIGN_MISSION_SCRIPT_INTERFACE.query_mission: method() --> QUERY_CAMPAIGN_MISSION_SCRIPT_INTERFACE
--# assume MODIFY_CAMPAIGN_MISSION_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_DIPLOMACY_ALLIANCE_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_ALLIANCE_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_DIPLOMACY_ALLIANCE_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_ALLIANCE_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_DIPLOMACY_ALLIANCE_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE
--[[
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions_promotion_is_active: method(faction_being_queries, faction_that_is_being_considered, stance_by_number)
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions_promotion_start_round: method(faction_being_queries, faction_that_is_being_considered, stance_by_number)
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions_is_being_blocked: method(faction_being_queries, faction_that_is_being_considered, stance_by_number)
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions_is_being_blocked_until: method(faction_being_queries, faction_that_is_being_considered, stance_by_number)
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions_promotion_end_level: method(faction_being_queries, faction_that_is_being_considered, stance_by_number)
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions_promotion_end_round: method(faction_being_queries, faction_that_is_being_considered, stance_by_number)
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions_available: method(faction_being_queries, faction_that_is_being_considered)
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions_promotion_start_level: method(faction_being_queries, faction_that_is_being_considered, stance_by_number)
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions_promotion_current_level: method(faction_being_queries, faction_that_is_being_considered, stance_by_number)
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions_promotion_or_blocking_is_set: method(faction_being_queries, faction_that_is_being_considered)
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE.strategic_stance_between_factions: method(faction_being_queries, faction_that_is_being_considered)
--]]
-- MODIFY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume MODIFY_FAMILY_MEMBER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_FAMILY_MEMBER_SCRIPT_INTERFACE.query_family_member: method() --> QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE
-- QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.all_ceos_for_category: method(category_key: string) --> QUERY_CEO_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.changing_points_for_ceo_data_will_have_no_impact: method(ceo_data_key: string) --> boolean
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.all_ceos_equipped_on_character: method() --> QUERY_CEO_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.all_ceo_equipment_slots_for_category: method(category_key: string) --> QUERY_CEO_EQUIPMENT_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.number_of_ceos_equipped_for_category: method(category_key: string) --> number
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.all_ceos: method() --> QUERY_CEO_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.all_ceo_equipment_slots: method() --> QUERY_CEO_EQUIPMENT_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.character: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.has_ceo_equipped: method(ceo_data_key: string) --> boolean
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.can_create_ceo: method(ceo_data_key: string) --> boolean
-- MODIFY_SLOT_SCRIPT_INTERFACE
--# assume MODIFY_SLOT_SCRIPT_INTERFACE.query_slot: method() --> QUERY_SLOT_SCRIPT_INTERFACE
--# assume MODIFY_SLOT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_SLOT_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- QUERY_MILITARY_FORCE_LIST_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_MILITARY_FORCE_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_CHARACTER_ASSIGNMENT_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_ASSIGNMENT_SCRIPT_INTERFACE.is_idle_assignment: method() --> boolean
--# assume QUERY_CHARACTER_ASSIGNMENT_SCRIPT_INTERFACE.assignment_record_key: method() --> string
--# assume QUERY_CHARACTER_ASSIGNMENT_SCRIPT_INTERFACE.assignment_state: method() --> string
--# assume QUERY_CHARACTER_ASSIGNMENT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CHARACTER_ASSIGNMENT_SCRIPT_INTERFACE.rounds_until_state_transition: method() --> number
-- MODIFY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume MODIFY_MILITARY_FORCE_SCRIPT_INTERFACE.change_stance: method( "stance " )
--# assume MODIFY_MILITARY_FORCE_SCRIPT_INTERFACE.query_military_force: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume MODIFY_MILITARY_FORCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_MILITARY_FORCE_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- QUERY_CHARACTER_POST_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_POST_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_CHARACTER_POST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_POST_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_CHARACTER_POST_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_FACTION_PROVINCE_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_PROVINCE_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_FACTION_PROVINCE_SCRIPT_INTERFACE
--# assume QUERY_FACTION_PROVINCE_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_FACTION_PROVINCE_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- MODIFY_REGION_MANAGER_SCRIPT_INTERFACE
--# assume MODIFY_REGION_MANAGER_SCRIPT_INTERFACE.query_region_manager: method() --> QUERY_REGION_MANAGER_SCRIPT_INTERFACE
--# assume MODIFY_REGION_MANAGER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_REGION_MANAGER_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_disable_movement_for_faction: method("faction_key")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_strategic_stance_manager_set_stance_promotion_between_factions_for_a_given_stance: method("stance_managing_faction_key", "target_faction_key", "stance_type_number", "start_round", "start_level", "end_round", "end_level")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_strategic_stance_manager_promote_specified_stance_towards_target_faction: method("stance_managing_faction_key", "target_faction_key", "stance_type")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_enable_movement_for_character: method("faction:f,type:t,ability:a,surname:s,forename:f,garrison:g,x:1,y:2,r:3")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_strategic_stance_manager_block_all_stances_but_that_specified_towards_target_faction: method("stance_managing_faction_key", "target_faction_key", "stance_type")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_strategic_stance_manager_clear_all_blocking_between_factions: method("stance_managing_faction_key", "target_faction_key")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_force_personality_change: method("faction_key", "game_phase", "current_quirk_bias")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_disable_command_assignment_for_character: method("faction:f,type:t,ability:a,surname:s,forename:f,garrison:g,x:1,y:2,r:3")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_strategic_stance_manager_set_stance_blocking_between_factions_for_a_given_stance: method("stance_managing_faction_key", "target_faction_key", "stance_type_number", "final_inclusive_blocking_round")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.query_campaign_ai: method() --> QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_enable_movement_for_faction: method("faction_key")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_disable_movement_for_character: method("faction:f,type:t,ability:a,surname:s,forename:f,garrison:g,x:1,y:2,r:3")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_enable_command_assignment_for_character: method("faction:f,type:t,ability:a,surname:s,forename:f,garrison:g,x:1,y:2,r:3")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_strategic_stance_manager_promote_specified_stance_towards_target_faction_by_number: method("stance_managing_faction_key", "target_faction_key", "stance_type_number")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_strategic_stance_manager_force_stance_update_between_factions: method("stance_managing_faction_key", "target_faction_key")
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_CAMPAIGN_AI_SCRIPT_INTERFACE.cai_strategic_stance_manager_clear_all_promotions_between_factions: method("stance_managing_faction_key", "target_faction_key")
-- QUERY_DIPLOMACY_NEGOTIATED_DEAL_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATED_DEAL_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_DIPLOMACY_NEGOTIATED_DEAL_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATED_DEAL_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_DIPLOMACY_NEGOTIATED_DEAL_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_CHARACTER_RELATIONSHIP_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_RELATIONSHIP_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_CHARACTER_RELATIONSHIP_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_RELATIONSHIP_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_CHARACTER_RELATIONSHIP_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_CEO_EQUIPMENT_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_CEO_EQUIPMENT_SLOT_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE
--# assume QUERY_CEO_EQUIPMENT_SLOT_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_CEO_EQUIPMENT_SLOT_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- MODIFY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE
--# assume MODIFY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE.query_military_force_slot: method() --> QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE
--# assume MODIFY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- QUERY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE
--# assume QUERY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.is_new_game: method() --> boolean
--# assume QUERY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
-- QUERY_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_CHARACTER_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE.retinue_commander: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE.campaign_model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE.linked_to_military_force_retinue: method() --> QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE.retinue_slots: method() --> QUERY_PERSISTENT_RETINUE_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE.command_queue_index: method() --> number
-- QUERY_DIPLOMACY_NEGOTIATION_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATION_SCRIPT_INTERFACE.cqi: method() --> number
--# assume QUERY_DIPLOMACY_NEGOTIATION_SCRIPT_INTERFACE.recipients: method() --> QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATION_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_DIPLOMACY_NEGOTIATION_SCRIPT_INTERFACE.proposers: method() --> QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE
-- QUERY_UNDERCOVER_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_UNDERCOVER_CHARACTER_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_UNDERCOVER_CHARACTER_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_UNDERCOVER_CHARACTER_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.is_discovered_and_discovery_resolved: method() --> boolean
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.is_discovered_waiting_resolve: method() --> boolean
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.upkeep_per_turn: method() --> number
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.current_faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.is_counter_undercover_character: method() --> boolean
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.deployment_target_faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.is_hired_by_non_source_faction: method() --> boolean
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.can_recall: method() --> boolean
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.is_returning_to_source_faction: method() --> boolean
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.cover_points: method() --> number
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.max_cover_points: method() --> number
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.cover_point_change_per_turn: method() --> number
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.is_in_source_faction: method() --> boolean
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.is_undiscovered: method() --> boolean
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.can_disown: method() --> boolean
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_UNDERCOVER_CHARACTER_SCRIPT_INTERFACE.source_faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
-- QUERY_UNIT_LIST_SCRIPT_INTERFACE
--# assume QUERY_UNIT_LIST_SCRIPT_INTERFACE.has_unit: method(" unit_key ") --> boolean
--# assume QUERY_UNIT_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_UNIT_LIST_SCRIPT_INTERFACE
--# assume QUERY_UNIT_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_UNIT_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE.linked_to_unit: method() --> QUERY_UNIT_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE.persistent_slot_unit_record_key: method() --> string
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE.slot_commander_is_commanding_military_force: method() --> boolean
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE.owning_military_force: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE.slot_commander_is_retinue_commander: method() --> boolean
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE.campaign_model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE.persistent_slot: method() --> QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE.slot_commander: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE.command_queue_index: method() --> number
-- QUERY_DIPLOMACY_DEAL_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_DEAL_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_DIPLOMACY_DEAL_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_DEAL_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_DIPLOMACY_DEAL_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_DIPLOMACY_PROPOSED_COMPONENT_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_PROPOSED_COMPONENT_SCRIPT_INTERFACE.recipient: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_PROPOSED_COMPONENT_SCRIPT_INTERFACE.proposer: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_PROPOSED_COMPONENT_SCRIPT_INTERFACE.treaty_component_key: method() --> string
--# assume QUERY_DIPLOMACY_PROPOSED_COMPONENT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.has_faction_command_queue_index: method(cqi: CA_CQI | int) --> boolean
--# assume QUERY_MODEL_SCRIPT_INTERFACE.is_multiplayer: method() --> boolean
--# assume QUERY_MODEL_SCRIPT_INTERFACE.event_generator_interface: method() --> QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.is_advisor_sound_playing: method() --> boolean
--# assume QUERY_MODEL_SCRIPT_INTERFACE.unit_scale_multiplier: method() --> number
--# assume QUERY_MODEL_SCRIPT_INTERFACE.campaign_game_mode: method() --> string
--# assume QUERY_MODEL_SCRIPT_INTERFACE.is_player_turn: method() --> boolean
--# assume QUERY_MODEL_SCRIPT_INTERFACE.campaign_type: method() --> number
--# assume QUERY_MODEL_SCRIPT_INTERFACE.historical_character_manager: method() --> QUERY_HISTORICAL_CHARACTER_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.region_slot_for_command_queue_index: method(region_slot_command_queue_index: int) --> QUERY_SLOT_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.character_for_command_queue_index: method(cqi: CA_CQI | int) --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.character_can_reach_character: method(source_character: QUERY_CHARACTER_SCRIPT_INTERFACE, target_character: QUERY_CHARACTER_SCRIPT_INTERFACE) --> boolean
--# assume QUERY_MODEL_SCRIPT_INTERFACE.military_force_for_command_queue_index: method(cqi: CA_CQI | int) --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.world: method() --> QUERY_WORLD_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.has_character_command_queue_index: method(cqi: CA_CQI | int) --> boolean
--# assume QUERY_MODEL_SCRIPT_INTERFACE.campaign_ai: method() --> QUERY_CAMPAIGN_AI_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.calendar_year: method() --> number
--# assume QUERY_MODEL_SCRIPT_INTERFACE.faction_for_command_queue_index: method(cqi: CA_CQI | int) --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.character_for_startpos_id: method(startpos_id: string) --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.has_military_force_command_queue_index: method(cqi: CA_CQI | int) --> boolean
--# assume QUERY_MODEL_SCRIPT_INTERFACE.local_faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.campaign_name: method() --> string
--# assume QUERY_MODEL_SCRIPT_INTERFACE.episodic_scripting: method() --> QUERY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.date_and_week_in_range: method(Inclusive) --> boolean
--# assume QUERY_MODEL_SCRIPT_INTERFACE.difficulty_level: method() --> number
--# assume QUERY_MODEL_SCRIPT_INTERFACE.is_benchmark_mode: method() --> boolean
--# assume QUERY_MODEL_SCRIPT_INTERFACE.pending_battle: method() --> QUERY_PENDING_BATTLE_SCRIPT_INTERFACE
--# assume QUERY_MODEL_SCRIPT_INTERFACE.turn_number: method() --> number
--# assume QUERY_MODEL_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_MODEL_SCRIPT_INTERFACE.date_in_range: method(Inclusive) --> boolean
-- QUERY_REGION_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_REGION_MANAGER_SCRIPT_INTERFACE.region_by_key: method("jap_tosa") --> QUERY_REGION_SCRIPT_INTERFACE
--# assume QUERY_REGION_MANAGER_SCRIPT_INTERFACE.region_list: method() --> QUERY_REGION_LIST_SCRIPT_INTERFACE
--# assume QUERY_REGION_MANAGER_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_REGION_MANAGER_SCRIPT_INTERFACE.resource_exists_anywhere: method("res_coffee") --> boolean
--# assume QUERY_REGION_MANAGER_SCRIPT_INTERFACE.slot_by_key: method("rice:jap_awa:farm") --> QUERY_SLOT_SCRIPT_INTERFACE
--# assume QUERY_REGION_MANAGER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_REGION_MANAGER_SCRIPT_INTERFACE.settlement_by_key: method("settlement:jap_aki:koriyama") --> QUERY_SETTLEMENT_SCRIPT_INTERFACE
-- QUERY_DIPLOMACY_DEAL_COMPONENT_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_DEAL_COMPONENT_SCRIPT_INTERFACE.recipient: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_DEAL_COMPONENT_SCRIPT_INTERFACE.proposer: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_DEAL_COMPONENT_SCRIPT_INTERFACE.treaty_component_key: method() --> string
--# assume QUERY_DIPLOMACY_DEAL_COMPONENT_SCRIPT_INTERFACE.round_signed: method() --> number
--# assume QUERY_DIPLOMACY_DEAL_COMPONENT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_POOLED_RESOURCE_LIST_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_POOLED_RESOURCE_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_HISTORICAL_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_HISTORICAL_CHARACTER_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_HISTORICAL_CHARACTER_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_HISTORICAL_CHARACTER_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- MODIFY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE.set_network_points_for_faction: method(query_interface: QUERY_FACTION_SCRIPT_INTERFACE, network_points: int)
-- MODIFY_FACTION_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.begin_tech_research: method( "technology_key" ) --> boolean
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_recruitable_character_from_template: method(agent_type_key: string, agent_subtype_key: string, generation_template_key: string)
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.lock_technology: method( "technology_key" )
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.trigger_incident: method(incident_key: string, fire_immediately: boolean) --> boolean
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.trigger_dilemma: method(dilemma_key: string, fire_immediately: boolean) --> boolean
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.apply_automatic_diplomatic_deal: method(automatic_deal_key: string, query_interface: QUERY_FACTION_SCRIPT_INTERFACE, parameters: string)
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.make_region_capital: method(QUERY_REGION_SCRIPT_INTERFACE) --> boolean
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.add_event_restricted_unit_record: method( "unit_key" )
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.add_event_restricted_building_record: method( "building_key" )
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_character_from_template: method(agent_type_key: string, agent_subtype_key: string, generation_template_key: string) --> MODIFY_CHARACTER_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.trigger_custom_mission_from_string: method("mission_def_str")
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.remove_effect_bundle: method("effect_bundle_key")
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_character: method(agent_type_key: string) --> MODIFY_CHARACTER_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.increase_treasury: method(amount: int)
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_force: method(  "unit_list", "region_key", x_position, y_position, "id", exclude_named_characters_bool )
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_force_with_existing_general: method("faction:chosokabe,forename:2147274846", "unit_list", "region_key", "x_position", "y_position", "id")
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.disable_movement: method()
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.unlock_technology: method( "technology_key" )
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_agent: method( "agent_key", "agent_subtype_key", x_position, y_position, "id", "character_generation_template_record_key" )
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.apply_effect_bundle: method("effect_bundle_key", turns)
--[[-# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_character_with_subtype: method(String agent_type_key, String agent_subtype_key, bool male) --> MODIFY_CHARACTER_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.cancel_custom_mission: method("mission_definition")
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.show_message_event_located: method( "title_localisation_key", "primary_detail_localisation_key", "secondary_detail_localisation_key", x_coord, y_coord, is_persistent_bool, index_int)
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.remove_event_restrict_all_units: method()
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.unlock_starting_general_recruitment: method("character_startpos_id")
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.remove_event_restricted_building_record: method( "building_key" )
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.get_map_pins_handler: method() --> MODIFY_MAP_PINS_HANDLER_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_recruitable_character_with_gender: method(String agent_type_key, bool male)
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_recruitable_character_with_subtype: method(String agent_type_key, String agent_subtype_key, bool male)
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_character_with_gender: method(String agent_type_key, bool male) --> MODIFY_CHARACTER_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_recruitable_character: method(String agent_type_key)
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.show_message_event: method( "title_localisation_key", "primary_detail_localisation_key", "secondary_detail_localisation_key", is_persistent_bool, index_int)
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.ceo_management: method() --> MODIFY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.enable_diplomacy: method(String recipient_filter, String component_keys, String reason_key)
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.lock_starting_general_recruitment: method("character_startpos_id")
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.enable_movement: method()
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.disable_diplomacy: method(String recipient_filter, String component_keys, String reason_key)
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.make_region_seen_in_shroud: method( "region_key" )
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.add_event_restrict_all_units: method()
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.make_region_visible_in_shroud: method( "region_key" )
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.trigger_mission: method("mission_key_1, mission_key_2", fire_immediately) --> boolean
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.query_faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.trigger_custom_mission: method("mission_definition")
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.create_force_with_general: method("unit_list", "region_key", x_position, y_position, "general_agent_type_key", "general_agent_subtype_key", "character_template_key", "id", "make_faction_leader")
--# assume MODIFY_FACTION_SCRIPT_INTERFACE.remove_event_restricted_unit_record: method( "unit_key" )
-- QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.can_recruit_unit: method(<unit_key>) --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.has_horde_details: method() --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.is_army: method() --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.has_garrison_residence: method() --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.military_force_retinues: method() --> QUERY_MILITARY_FORCE_RETINUE_LIST_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.upkeep: method() --> number
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.can_recruit_unit_class: method(<unit_class_key>) --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.pooled_resources: method() --> QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.unit_list: method() --> QUERY_UNIT_LIST_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.character_list: method() --> QUERY_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.contains_mercenaries: method() --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.general_character: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.is_armed_citizenry: method() --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.can_recruit_agent_at_force: method(<agent_key>) --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.can_recruit_unit_category: method(<unit_category_key>) --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.morale: method() --> number
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.has_general: method() --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.strength: method() --> number
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.active_stance: method() --> string
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.garrison_residence: method() --> QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.is_navy: method() --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.can_activate_stance: method( "stance" ) --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.horde_details: method() --> QUERY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_MILITARY_FORCE_SCRIPT_INTERFACE.command_queue_index: method() --> number
-- QUERY_POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_HISTORICAL_CHARACTER_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_HISTORICAL_CHARACTER_MANAGER_SCRIPT_INTERFACE.historical_character_for_record_key: method( "historical_character_record_key" ) --> QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_HISTORICAL_CHARACTER_MANAGER_SCRIPT_INTERFACE.all_historical_characters_for_faction_agent_type: method( "faction_key", "agent_type_key" ) --> QUERY_HISTORICAL_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_HISTORICAL_CHARACTER_MANAGER_SCRIPT_INTERFACE.historical_character_has_been_generated: method( QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACEQUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE ) --> boolean
--# assume QUERY_HISTORICAL_CHARACTER_MANAGER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_HISTORICAL_CHARACTER_MANAGER_SCRIPT_INTERFACE.all_valid_generatable_historical_characters_for_faction_agent_type: method( "faction_key", "agent_type_key" ) --> QUERY_HISTORICAL_CHARACTER_LIST_SCRIPT_INTERFACE
-- QUERY_PENDING_BATTLE_SCRIPT_INTERFACE
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.attacker_battle_result: method() --> string
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.percentage_of_attacker_killed: method() --> number
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.percentage_of_defender_killed: method() --> number
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.naval_battle: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.attacker_commander_fought_in_battle: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.human_involved: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.has_been_fought: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.night_battle: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.is_active: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.defender: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.defender_strength: method() --> number
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.defender_commander_fought_in_battle: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.failed_ambush_battle: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.battle_type: method() --> string
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.ambush_battle: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.contested_garrison: method() --> QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.seige_battle: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.has_contested_garrison: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.percentage_of_attacker_routed: method() --> number
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.defender_commander_fought_in_melee: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.attacker_commander_fought_in_melee: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.attacker_strength: method() --> number
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.attacker: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.has_defender: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.percentage_of_defender_routed: method() --> number
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.defender_battle_result: method() --> string
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.attacker_is_stronger: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.secondary_defenders: method() --> QUERY_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.has_attacker: method() --> boolean
--# assume QUERY_PENDING_BATTLE_SCRIPT_INTERFACE.secondary_attackers: method() --> QUERY_CHARACTER_LIST_SCRIPT_INTERFACE
-- QUERY_MILITARY_FORCE_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SLOT_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SLOT_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_MILITARY_FORCE_SLOT_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_CAMPAIGN_BATTLE_LOG_DUEL_LIST_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_DUEL_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_CAMPAIGN_BATTLE_LOG_DUEL_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_DUEL_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_CAMPAIGN_BATTLE_LOG_DUEL_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE.maximum_value: method() --> number
--# assume QUERY_POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE.minimum_value: method() --> number
--# assume QUERY_POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE.value: method() --> number
--# assume QUERY_POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE.record_key: method() --> string
--# assume QUERY_POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE.percentage_of_capacity: method() --> number
-- QUERY_DIPLOMACY_DEAL_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_DEAL_SCRIPT_INTERFACE.recipients: method() --> QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_DEAL_SCRIPT_INTERFACE.cqi: method() --> number
--# assume QUERY_DIPLOMACY_DEAL_SCRIPT_INTERFACE.components: method() --> QUERY_DIPLOMACY_DEAL_COMPONENT_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_DEAL_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_DIPLOMACY_DEAL_SCRIPT_INTERFACE.proposers: method() --> QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE
-- MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.take_shroud_snapshot: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.cinematic: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.restore_shroud_from_snapshot: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.show_shroud: method( show )
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.add_event_restricted_unit_record: method("unit_record", "disabled_tooltip")
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.steal_user_input: method( enable )
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.remove_vfx: method("test")
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.register_instant_movie_by_record: method(String key)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.remove_custom_battlefield: method(String id)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.remove_time_trigger: method( "id_string" )
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.override_ui: method("ui_id", enable)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.add_custom_battlefield: method(String id, float32 x_pos, float32 y_pos, float32 radius, bool dump_campaign, String override_loading_screen, String override_script_path, String battle_path, card32 human_alliance, bool launch_battle_immediately, bool is_land_battle)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.make_neighbouring_regions_visible_in_shroud: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.remove_area_trigger: method("name")
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.disable_shortcut: method("object_id", "function_id", set_disabled)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.add_vfx: method("test", "vfx_id (campaign_vfx_lookup_table)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.fade_shroud: method(duration_seconds, target_alpha)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.disable_saving_game: method(true)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.toggle_incident_generation: method(bool enabled)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.take_screenshot: method(String filename)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.suppress_all_event_feed_event_types: method(true)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.trigger_performance_metrics_stop: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.add_marker: method("test_id", "ping_type", 10, 50, 2)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.trigger_performance_metrics_start: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.make_sea_region_visible_in_shroud: method( "sea region key" )
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.toggle_mission_generation: method(bool enabled)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.register_outro_movie: method( "movie_path" )
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.disable_event_feed_events: method(true, "category_key_1;category_key_2", "", "event_key")
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.remove_event_restrict_all_units: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.autosave_at_next_opportunity: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.remove_event_restricted_building_record: method("building_record")
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.dismiss_advice: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.whitelist_event_feed_event_type: method("agent_action_vs_armyevent_feed_target_agent_faction")
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.steal_escape_key: method( steal )
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.fade_scene: method(duration_seconds, target_brghtness)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.add_time_trigger: method( "id_string", time_in_seconds_float  )
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.add_event_restricted_building_record: method("building_record")
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.add_event_restrict_all_units: method("disabled_tooltip")
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.show_borders: method( show )
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.remove_marker: method("test_id")
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.make_neighbouring_regions_seen_in_shroud: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.remove_event_restricted_unit_record: method("unit_record")
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.register_instant_movie: method( "movie_path" )
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.add_circle_area_trigger: method(x, y, radius, "name", "filter", trigger_on_enter, trigger_on_exit, trigger_once_only)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.disable_end_turn: method(true)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.query_episodic_scripting: method() --> QUERY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.toggle_dilemma_generation: method(bool enabled)
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.make_sea_region_seen_in_shroud: method( "sea region key" )
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.end_turn: method()
--# assume MODIFY_EPISODIC_SCRIPTING_SCRIPT_INTERFACE.set_ui_enabled: method( enable_bool )
-- QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE
--# assume QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE.category_key: method() --> string
--# assume QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE.all_equippable_ceos: method() --> QUERY_CEO_LIST_SCRIPT_INTERFACE
--# assume QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE.can_unequip_ceo: method() --> boolean
--# assume QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE.equipped_ceo: method() --> QUERY_CEO_SCRIPT_INTERFACE
--# assume QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE.command_queue_index: method() --> number
-- QUERY_CEO_LIST_SCRIPT_INTERFACE
--# assume QUERY_CEO_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_CEO_SCRIPT_INTERFACE
--# assume QUERY_CEO_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_CEO_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- MODIFY_SETTLEMENT_SCRIPT_INTERFACE
--# assume MODIFY_SETTLEMENT_SCRIPT_INTERFACE.query_settlement: method() --> QUERY_SETTLEMENT_SCRIPT_INTERFACE
--# assume MODIFY_SETTLEMENT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_SETTLEMENT_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- QUERY_WORLD_SCRIPT_INTERFACE
--# assume QUERY_WORLD_SCRIPT_INTERFACE.whose_turn_is_it: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_WORLD_SCRIPT_INTERFACE.faction_exists: method("rom_rome") --> boolean
--# assume QUERY_WORLD_SCRIPT_INTERFACE.climate_phase_index: method() --> number
--# assume QUERY_WORLD_SCRIPT_INTERFACE.province_list: method() --> QUERY_PROVINCE_LIST_SCRIPT_INTERFACE
--# assume QUERY_WORLD_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_WORLD_SCRIPT_INTERFACE.region_manager: method() --> QUERY_REGION_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_WORLD_SCRIPT_INTERFACE.faction_by_key: method("rom_rome") --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_WORLD_SCRIPT_INTERFACE.faction_list: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_WORLD_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- MODIFY_MAP_PINS_HANDLER_SCRIPT_INTERFACE
--# assume MODIFY_MAP_PINS_HANDLER_SCRIPT_INTERFACE.remove_all_runtime_script_pins: method()
--# assume MODIFY_MAP_PINS_HANDLER_SCRIPT_INTERFACE.add_settlement_pin: method(MODIFY_SETTLEMENT_SCRIPT_INTERFACEMODIFY_SETTLEMENT_SCRIPT_INTERFACE* for_settlement, String map_pins_record_key, bool is_visible) --> number
--# assume MODIFY_MAP_PINS_HANDLER_SCRIPT_INTERFACE.add_character_pin: method(MODIFY_CHARACTER_SCRIPT_INTERFACEMODIFY_CHARACTER_SCRIPT_INTERFACE* for_character, String map_pins_record_key, bool is_visible) --> number
--# assume MODIFY_MAP_PINS_HANDLER_SCRIPT_INTERFACE.remove_pin: method(card32 pin_command_queue_index)
--# assume MODIFY_MAP_PINS_HANDLER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_MAP_PINS_HANDLER_SCRIPT_INTERFACE.add_terrain_pin: method(card32 at_logical_pos_x, card32 at_logical_pos_y, String map_pins_record_key, bool is_visible) --> number
-- QUERY_PROVINCE_SCRIPT_INTERFACE
--# assume QUERY_PROVINCE_SCRIPT_INTERFACE.faction_province_list: method() --> QUERY_FACTION_PROVINCE_LIST_SCRIPT_INTERFACE
--# assume QUERY_PROVINCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_PROVINCE_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
-- QUERY_PERSISTENT_RETINUE_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SLOT_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SLOT_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_PERSISTENT_RETINUE_SLOT_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_CEO_SCRIPT_INTERFACE
--# assume QUERY_CEO_SCRIPT_INTERFACE.equipped_in_slot: method() --> QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE
--# assume QUERY_CEO_SCRIPT_INTERFACE.category_key: method() --> string
--# assume QUERY_CEO_SCRIPT_INTERFACE.is_equipped_in_slot: method() --> boolean
--# assume QUERY_CEO_SCRIPT_INTERFACE.current_node_key: method() --> string
--# assume QUERY_CEO_SCRIPT_INTERFACE.num_points_in_ceo: method() --> number
--# assume QUERY_CEO_SCRIPT_INTERFACE.ceo_data_key: method() --> string
--# assume QUERY_CEO_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CEO_SCRIPT_INTERFACE.command_queue_index: method() --> number
-- QUERY_SLOT_SCRIPT_INTERFACE
--# assume QUERY_SLOT_SCRIPT_INTERFACE.type: method() --> string
--# assume QUERY_SLOT_SCRIPT_INTERFACE.region: method() --> QUERY_REGION_SCRIPT_INTERFACE
--# assume QUERY_SLOT_SCRIPT_INTERFACE.building: method() --> QUERY_BUILDING_SCRIPT_INTERFACE
--# assume QUERY_SLOT_SCRIPT_INTERFACE.has_building: method() --> boolean
--# assume QUERY_SLOT_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_SLOT_SCRIPT_INTERFACE.name: method() --> string
--# assume QUERY_SLOT_SCRIPT_INTERFACE.faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_SLOT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_SLOT_SCRIPT_INTERFACE.command_queue_index: method() --> number
-- QUERY_MILITARY_FORCE_BUILDING_LIST_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_BUILDING_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_BUILDING_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_MILITARY_FORCE_BUILDING_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.all_ceos_for_category: method(String category_key) --> QUERY_CEO_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.changing_points_for_ceo_data_will_have_no_impact: method(String ceo_data_key) --> boolean
--# assume QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.all_ceos: method() --> QUERY_CEO_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE.can_create_ceo: method(String ceo_data_key) --> boolean
-- QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE.maximum_value: method() --> number
--# assume QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE.number_of_effect_types: method() --> number
--# assume QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE.record_key: method() --> string
--# assume QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE.active_effect: method(card32 effect_type) --> string
--# assume QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE.percentage_of_capacity: method() --> number
--# assume QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE.minimum_value: method() --> number
--# assume QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE.value: method() --> number
--# assume QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE.factors: method() --> QUERY_POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE.ending_spawn_year: method() --> number
--# assume QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE.agent_type_key: method() --> string
--# assume QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE.starting_spawn_year: method() --> number
--# assume QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE.record_key: method() --> string
--# assume QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_HISTORICAL_CHARACTER_SCRIPT_INTERFACE.faction_key: method() --> string
-- QUERY_MILITARY_FORCE_RETINUE_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_MILITARY_FORCE_RETINUE_SLOT_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_SCRIPT_INTERFACE.personal_kills: method() --> number
--# assume QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_SCRIPT_INTERFACE.character: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_SCRIPT_INTERFACE.retinue_kills: method() --> number
-- QUERY_UNIT_SCRIPT_INTERFACE
--# assume QUERY_UNIT_SCRIPT_INTERFACE.unit_category: method() --> string
--# assume QUERY_UNIT_SCRIPT_INTERFACE.military_force: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_UNIT_SCRIPT_INTERFACE.unit_class: method() --> string
--# assume QUERY_UNIT_SCRIPT_INTERFACE.unit_key: method() --> string
--# assume QUERY_UNIT_SCRIPT_INTERFACE.experience_level: method() --> number
--# assume QUERY_UNIT_SCRIPT_INTERFACE.is_naval_unit: method() --> boolean
--# assume QUERY_UNIT_SCRIPT_INTERFACE.has_unit_commander: method() --> boolean
--# assume QUERY_UNIT_SCRIPT_INTERFACE.can_upgrade_unit_equipment: method() --> boolean
--# assume QUERY_UNIT_SCRIPT_INTERFACE.force_commander: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_UNIT_SCRIPT_INTERFACE.can_upgrade_unit: method() --> boolean
--# assume QUERY_UNIT_SCRIPT_INTERFACE.military_force_retinue: method() --> QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE
--# assume QUERY_UNIT_SCRIPT_INTERFACE.is_land_unit: method() --> boolean
--# assume QUERY_UNIT_SCRIPT_INTERFACE.unit_commander: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_UNIT_SCRIPT_INTERFACE.percentage_proportion_of_full_strength: method() --> number
--# assume QUERY_UNIT_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_UNIT_SCRIPT_INTERFACE.faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_UNIT_SCRIPT_INTERFACE.military_force_retinue_slot: method() --> QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_UNIT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_UNIT_SCRIPT_INTERFACE.has_force_commander: method() --> boolean
-- QUERY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE.miltary_force: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE.miltary_force_slot_list: method() --> QUERY_MILITARY_FORCE_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_MILITARY_FORCE_HORDE_DETAILS_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
-- QUERY_CAMPAIGN_MISSION_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_MISSION_SCRIPT_INTERFACE.cqi: method() --> number
--# assume QUERY_CAMPAIGN_MISSION_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_MISSION_SCRIPT_INTERFACE.mission_issuer_record_key: method() --> string
--# assume QUERY_CAMPAIGN_MISSION_SCRIPT_INTERFACE.mission_record_key: method() --> string
--# assume QUERY_CAMPAIGN_MISSION_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CAMPAIGN_MISSION_SCRIPT_INTERFACE.faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
-- QUERY_MILITARY_FORCE_RETINUE_LIST_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_MILITARY_FORCE_RETINUE_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- MODIFY_PROVINCE_SCRIPT_INTERFACE
--# assume MODIFY_PROVINCE_SCRIPT_INTERFACE.query_province: method() --> QUERY_PROVINCE_SCRIPT_INTERFACE
--# assume MODIFY_PROVINCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_PROVINCE_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- QUERY_DIPLOMACY_NEGOTIATED_DEALS_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATED_DEALS_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_DIPLOMACY_NEGOTIATED_DEALS_SCRIPT_INTERFACE.deals: method() --> QUERY_DIPLOMACY_NEGOTIATED_DEAL_LIST_SCRIPT_INTERFACE
-- QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE.has_mother: method() --> boolean
--# assume QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE.father: method() --> QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE.spouse: method() --> QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE.mother: method() --> QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE.come_of_age: method() --> boolean
--# assume QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE.has_spouse: method() --> boolean
--# assume QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE.has_father: method() --> boolean
-- QUERY_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_SLOT_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_SLOT_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_SLOT_LIST_SCRIPT_INTERFACE.buliding_type_exists: method( "building_level_record_key" ) --> boolean
--# assume QUERY_SLOT_LIST_SCRIPT_INTERFACE.slot_type_exists: method( "slot_key" ) --> boolean
--# assume QUERY_SLOT_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE.military_force: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE.has_building: method() --> boolean
--# assume QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE.building: method() --> QUERY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_BUILDING_LIST_SCRIPT_INTERFACE
--# assume QUERY_BUILDING_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_BUILDING_LIST_SCRIPT_INTERFACE
--# assume QUERY_BUILDING_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_BUILDING_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- MODIFY_FACTION_PROVINCE_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_PROVINCE_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
--# assume MODIFY_FACTION_PROVINCE_SCRIPT_INTERFACE.set_public_order: method( value_int )
--# assume MODIFY_FACTION_PROVINCE_SCRIPT_INTERFACE.set_public_order_disabled: method( is_disabled_bool )
--# assume MODIFY_FACTION_PROVINCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_FACTION_PROVINCE_SCRIPT_INTERFACE.query_faction_province: method() --> QUERY_FACTION_PROVINCE_SCRIPT_INTERFACE
-- QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.has_navy: method() --> boolean
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.has_army: method() --> boolean
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.buildings: method() --> QUERY_BUILDING_LIST_SCRIPT_INTERFACE
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.is_under_siege: method() --> boolean
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.region: method() --> QUERY_REGION_SCRIPT_INTERFACE
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.unit_count: method() --> number
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.can_be_occupied_by_faction: method(String faction) --> boolean
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.army: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.navy: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.is_settlement: method() --> boolean
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.is_slot: method() --> boolean
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.settlement_interface: method() --> QUERY_SETTLEMENT_SCRIPT_INTERFACE
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.can_assault: method() --> boolean
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.slot_interface: method() --> QUERY_SLOT_SCRIPT_INTERFACE
-- QUERY_PERSISTENT_RETINUE_SLOT_RECRUITMENT_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SLOT_RECRUITMENT_SCRIPT_INTERFACE.campaign_model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SLOT_RECRUITMENT_SCRIPT_INTERFACE.is_recruiting: method() --> boolean
--# assume QUERY_PERSISTENT_RETINUE_SLOT_RECRUITMENT_SCRIPT_INTERFACE.recruiting_unit_key: method() --> string
--# assume QUERY_PERSISTENT_RETINUE_SLOT_RECRUITMENT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_PERSISTENT_RETINUE_SLOT_RECRUITMENT_SCRIPT_INTERFACE.can_recruit: method() --> boolean
-- MODIFY_WORLD_SCRIPT_INTERFACE
--# assume MODIFY_WORLD_SCRIPT_INTERFACE.query_world: method() --> QUERY_WORLD_SCRIPT_INTERFACE
--# assume MODIFY_WORLD_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_WORLD_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- QUERY_FACTION_PROVINCE_SCRIPT_INTERFACE
--# assume QUERY_FACTION_PROVINCE_SCRIPT_INTERFACE.tax_administration_cost: method() --> number
--# assume QUERY_FACTION_PROVINCE_SCRIPT_INTERFACE.pooled_resources: method() --> QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_FACTION_PROVINCE_SCRIPT_INTERFACE.region_list: method() --> QUERY_REGION_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_PROVINCE_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_FACTION_PROVINCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_FACTION_PROVINCE_SCRIPT_INTERFACE.province: method() --> QUERY_PROVINCE_SCRIPT_INTERFACE
-- QUERY_PROVINCE_LIST_SCRIPT_INTERFACE
--# assume QUERY_PROVINCE_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_PROVINCE_SCRIPT_INTERFACE
--# assume QUERY_PROVINCE_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_PROVINCE_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.resource: method(String resource_key) --> QUERY_POOLED_RESOURCE_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.is_region_scope: method() --> boolean
--# assume QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.is_faction_scope: method() --> boolean
--# assume QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.owning_faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.can_afford_resource_transaction: method(String resource_transaction_key) --> boolean
--# assume QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.is_faction_province_scope: method() --> boolean
--# assume QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.resources: method() --> QUERY_POOLED_RESOURCE_LIST_SCRIPT_INTERFACE
--# assume QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.is_military_force_scope: method() --> boolean
-- QUERY_CAMPAIGN_BATTLE_LOG_DUEL_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_DUEL_SCRIPT_INTERFACE.proposer: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_DUEL_SCRIPT_INTERFACE.outcome: method() --> string
--# assume QUERY_CAMPAIGN_BATTLE_LOG_DUEL_SCRIPT_INTERFACE.has_winner: method() --> boolean
--# assume QUERY_CAMPAIGN_BATTLE_LOG_DUEL_SCRIPT_INTERFACE.target: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_DUEL_SCRIPT_INTERFACE.winner: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_DUEL_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CAMPAIGN_BATTLE_LOG_DUEL_SCRIPT_INTERFACE.loser: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
-- MODIFY_PENDING_BATTLE_SCRIPT_INTERFACE
--# assume MODIFY_PENDING_BATTLE_SCRIPT_INTERFACE.query_pending_battle: method() --> QUERY_PENDING_BATTLE_SCRIPT_INTERFACE
--# assume MODIFY_PENDING_BATTLE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_PENDING_BATTLE_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- QUERY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE.slot: method() --> QUERY_MILITARY_FORCE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE.military_force: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
-- MODIFY_BUILDING_SCRIPT_INTERFACE
--# assume MODIFY_BUILDING_SCRIPT_INTERFACE.query_building: method() --> QUERY_BUILDING_SCRIPT_INTERFACE
--# assume MODIFY_BUILDING_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_BUILDING_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.gravitas: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.offensive_battles_fought: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.battles_won: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.commanded_resistent_retinue_slot: method() --> QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.character_subtype_key: method() --> string
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.defensive_naval_battles_fought: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.offensive_naval_battles_won: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.action_points_remaining_percent: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.defensive_sieges_won: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_carrying_troops: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.age: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.offensive_sieges_fought: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.garrison_residence: method() --> QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_caster: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.get_surname: method() --> string
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_blockading: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.commanded_military_force_retinue: method() --> QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.performed_action_this_turn: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.offensive_naval_battles_fought: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.military_force: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.has_undercover_character_enabler: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.get_max_attribute_value: method(String attribute_type_record_key) --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.has_garrison_residence: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.has_father: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.turns_in_enemy_regions: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.logical_position_x: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_faction_leader: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.commanded_persistent_retinue: method() --> QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.ceo_management: method() --> QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.logical_position_y: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.offensive_ambush_battles_won: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.character_type: method("ninja") --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.in_port: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.battles_fought: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.defensive_naval_battles_won: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_male: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.has_region: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.get_forename: method() --> string
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.body_guard_casulties: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.offensive_sieges_won: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.turns_in_own_regions: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.get_min_attribute_value: method(String attribute_type_record_key) --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.get_current_attribute_value: method(String attribute_type_record_key) --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.offensive_battles_won: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_politician: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_wounded: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.post_battle_ceo_chance: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.display_position_y: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.active_assignment: method() --> QUERY_CHARACTER_ASSIGNMENT_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.character_post: method() --> QUERY_CHARACTER_POST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.undercover_character_links: method() --> QUERY_UNDERCOVER_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.region: method() --> QUERY_REGION_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.latest_wound_death_type: method() --> string
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.generation_template_key: method() --> string
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.turns_at_sea: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_character_is_faction_recruitment_pool: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.startpos_key: method() --> string
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_spy: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.routed_in_battle: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.owned_persistent_retinue: method() --> QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_dead: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.mother: method() --> QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.command_queue_index: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.family_member: method() --> QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.action_points_per_turn: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_visible_to_faction: method("faction") --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.defensive_ambush_battles_fought: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.cqi: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.has_mother: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.loyalty: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.in_settlement: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_ambushing: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.has_recruited_mercenaries: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.relationships: method() --> QUERY_CHARACTER_RELATIONSHIP_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.defensive_battles_fought: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.character_subtype: method("emp_celestial_wizard") --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.fought_in_battle: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_at_sea: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_deployed: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_hidden: method(<faction_key>) --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.commanded_military_force_retinue_slot: method() --> QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_embedded_in_military_force: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.has_skill: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.defensive_sieges_fought: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.defensive_battles_won: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.has_military_force: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.display_position_x: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.won_battle: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.father: method() --> QUERY_FAMILY_MEMBER_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.defensive_ambush_battles_won: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.offensive_ambush_battles_fought: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.is_besieging: method() --> boolean
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.rank: method() --> number
--# assume QUERY_CHARACTER_SCRIPT_INTERFACE.percentage_of_own_alliance_killed: method() --> number
-- QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE.owning_retinue: method() --> QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE.slot_index: method() --> number
--# assume QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE.retinue_slot_commander: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE.campaign_model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE.recruitment_interface: method() --> QUERY_PERSISTENT_RETINUE_SLOT_RECRUITMENT_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE.slot_unit_record_key: method() --> string
--# assume QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE.linked_to_military_force_retinue_slot: method() --> QUERY_MILITARY_FORCE_RETINUE_SLOT_SCRIPT_INTERFACE
--# assume QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_PERSISTENT_RETINUE_SLOT_SCRIPT_INTERFACE.command_queue_index: method() --> number
-- QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.faction_leader: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.can_be_horde: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.trade_route_limit_reached: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.diplomatic_standing_with: method( FACTION_QUERY_INTERFACE ) --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.faction_province_list: method() --> QUERY_FACTION_PROVINCE_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.has_specified_diplomatic_deal_with_anybody: method(String component_key) --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.discovered_unresolved_undercover_characters_in_faction: method() --> QUERY_UNDERCOVER_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.subculture: method() --> string
--# assume QUERY_FACTION_SCRIPT_INTERFACE.trade_value_percent: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.holds_entire_province: method(String province, bool include_vassals) --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.has_capital_region: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.num_allies: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.factions_met: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.maximum_characters_in_recruitment_pool: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.ceo_management: method() --> QUERY_FACTION_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.capital_region: method() --> QUERY_REGION_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.has_faction_leader: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.treasury_percent: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.region_list: method() --> QUERY_REGION_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.has_technology: method("beer") --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.trade_ship_not_in_trade_node: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.number_of_factions_we_have_specified_diplomatic_deal_with: method(String component_key) --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.character_list: method() --> QUERY_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.losing_money: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.pooled_resources: method() --> QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.at_war_with: method(context:character() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.upkeep_expenditure_percent: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.undercover_character_manager: method() --> QUERY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.factions_trading_with: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.at_war: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.factions_we_have_specified_diplomatic_deal_with: method(String component_key) --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.unused_international_trade_route: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.is_quest_battle_faction: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.military_force_list: method() --> QUERY_MILITARY_FORCE_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.tax_level: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.name: method() --> string
--# assume QUERY_FACTION_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.is_world_leader: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.command_queue_index: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.research_queue_idle: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.trade_resource_exists: method("res_gold") --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.progression_level: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.factions_at_war_with: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.num_generals: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.is_at_civil_war: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.number_of_world_leader_regions: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.can_apply_automatic_diplomatic_deal: method(String automatic_deal_key, QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE * other_faction_interface, String parameters) --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.trade_value: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.has_specified_diplomatic_deal_with: method(String component_key, QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE * other_faction_interface) --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.culture: method() --> string
--# assume QUERY_FACTION_SCRIPT_INTERFACE.is_horde: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.state_religion: method() --> string
--# assume QUERY_FACTION_SCRIPT_INTERFACE.has_food_shortages: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.number_of_employed_characters: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.number_of_characters_in_recruitment_pool: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.is_human: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.factions_of_same_culture: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.foreign_undercover_characters_in_faction: method() --> QUERY_UNDERCOVER_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.treasury: method() --> number
--# assume QUERY_FACTION_SCRIPT_INTERFACE.allied_with: method(context:character() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.factions_of_same_subculture: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_SCRIPT_INTERFACE.is_dead: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.is_vassal: method() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.is_ally_vassal_or_client_state_of: method(context:character() --> boolean
--# assume QUERY_FACTION_SCRIPT_INTERFACE.character_posts: method() --> QUERY_CHARACTER_POST_LIST_SCRIPT_INTERFACE
-- QUERY_REGION_LIST_SCRIPT_INTERFACE
--# assume QUERY_REGION_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_REGION_SCRIPT_INTERFACE
--# assume QUERY_REGION_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_REGION_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_CHARACTER_RELATIONSHIP_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_RELATIONSHIP_SCRIPT_INTERFACE.get_relationship_characters: method() --> QUERY_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_RELATIONSHIP_SCRIPT_INTERFACE.relationship_record_key: method() --> string
--# assume QUERY_CHARACTER_RELATIONSHIP_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.any_of_missions_active_with_issuer: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction, String issuer_keys) --> boolean
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.round_last_valid_mission_was_generated: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction) --> number
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.have_any_of_missions_been_generated: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction, String mission_keys) --> boolean
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.any_of_missions_generated_with_issuer: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction, String issuer_keys) --> boolean
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.round_last_valid_incident_was_generated: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction) --> number
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.round_last_mission_was_generated_with_issuer: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction, String issuer_keys) --> number
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.have_any_of_dilemmas_been_generated: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction, String dilemma_keys) --> boolean
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.dilemma_choice_made: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction, String dilemma_key) --> string
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.have_any_of_incidents_been_generated: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction, String incident_keys) --> boolean
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.any_of_missions_active: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction, String mission_keys) --> boolean
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.rounds_until_issuer_valid: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction, String issuer_key) --> number
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.round_last_valid_event_was_generated: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction) --> number
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.any_of_missions_active_with_status: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction, String mission_keys, String status_key) --> boolean
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_EVENT_GENERATOR_SCRIPT_INTERFACE.round_last_valid_dilemma_was_generated: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction) --> number
-- QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE.owning_military_force: method() --> QUERY_MILITARY_FORCE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE.campaign_model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE.persistent_retinue: method() --> QUERY_PERSISTENT_RETINUE_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE.military_force_retinue_slots: method() --> QUERY_MILITARY_FORCE_RETINUE_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE.retinue_commander_is_commanding_military_force: method() --> boolean
--# assume QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE.retinue_commander: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_MILITARY_FORCE_RETINUE_SCRIPT_INTERFACE.command_queue_index: method() --> number
-- QUERY_SETTLEMENT_SCRIPT_INTERFACE
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.is_port: method() --> boolean
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.region: method() --> QUERY_REGION_SCRIPT_INTERFACE
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.logical_position_y: method() --> number
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.has_commander: method() --> boolean
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.slot_list: method() --> QUERY_SLOT_LIST_SCRIPT_INTERFACE
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.display_position_x: method() --> number
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.model: method() --> QUERY_MODEL_SCRIPT_INTERFACE
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.logical_position_x: method() --> number
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.commander: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_SETTLEMENT_SCRIPT_INTERFACE.display_position_y: method() --> number
-- QUERY_CHARACTER_POST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_POST_SCRIPT_INTERFACE.ministerial_position_record_key: method() --> string
--# assume QUERY_CHARACTER_POST_SCRIPT_INTERFACE.post_holders: method() --> QUERY_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_CHARACTER_POST_SCRIPT_INTERFACE.cqi: method() --> number
--# assume QUERY_CHARACTER_POST_SCRIPT_INTERFACE.current_post_holders: method() --> number
--# assume QUERY_CHARACTER_POST_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_CHARACTER_POST_SCRIPT_INTERFACE.maximum_post_holders: method() --> number
-- QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_SCRIPT_INTERFACE.primary_faction: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_SCRIPT_INTERFACE.negotiation_role: method() --> string
--# assume QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_SCRIPT_INTERFACE.is_primary_participant: method() --> boolean
--# assume QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_SCRIPT_INTERFACE.other_factions: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_DIPLOMACY_ALLIANCE_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_ALLIANCE_SCRIPT_INTERFACE.members: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_ALLIANCE_SCRIPT_INTERFACE.contains_member: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE* faction) --> boolean
--# assume QUERY_DIPLOMACY_ALLIANCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_FACTION_SCRIPT_INTERFACE
--# assume QUERY_FACTION_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_FACTION_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_SCRIPT_INTERFACE
--# assume QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_CAMPAIGN_BATTLE_LOG_CHARACTER_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- MODIFY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE
--# assume MODIFY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE.query_military_force_building: method() --> QUERY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE
--# assume MODIFY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- MODIFY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE
--# assume MODIFY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.apply_resource_transaction: method(String resource_transaction_key) --> boolean
--# assume MODIFY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.resource: method(String resource_key) --> MODIFY_POOLED_RESOURCE_SCRIPT_INTERFACE
--# assume MODIFY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE.query_pooled_resource_manager: method() --> QUERY_POOLED_RESOURCE_MANAGER_SCRIPT_INTERFACE
-- MODIFY_GARRISON_RESIDENCE_SCRIPT_INTERFACE
--# assume MODIFY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.join_garrison: method( query_character_script_interface )
--# assume MODIFY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.query_garrison_residence: method() --> QUERY_GARRISON_RESIDENCE_SCRIPT_INTERFACE
--# assume MODIFY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
--# assume MODIFY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.leave_garrison: method( )
--# assume MODIFY_GARRISON_RESIDENCE_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
-- QUERY_DIPLOMACY_DEAL_COMPONENT_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_DEAL_COMPONENT_LIST_SCRIPT_INTERFACE.item_at: method() --> QUERY_DIPLOMACY_DEAL_COMPONENT_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_DEAL_COMPONENT_LIST_SCRIPT_INTERFACE.num_items: method() --> number
--# assume QUERY_DIPLOMACY_DEAL_COMPONENT_LIST_SCRIPT_INTERFACE.is_empty: method() --> boolean
-- MODIFY_CHARACTER_SCRIPT_INTERFACE
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.attack_settlement: method( query_settlement_script_interface )
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.kill_character: method( destroy_force_bool )
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.attack_garrison: method( query_garrison_residence_script_interface )
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.apply_relationship_trigger_set: method(QUERY_CHARACTER_SCRIPT_INTERFACEQUERY_CHARACTER_SCRIPT_INTERFACE* receiver_root, String relationship_trigger_set_key)
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.wound_character: method("convalescence_time")
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.set_undercover_character_enabler: method(bool enabled)
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.query_character: method() --> QUERY_CHARACTER_SCRIPT_INTERFACE
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.zero_action_points: method()
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.replenish_action_points: method()
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.ceo_management: method() --> MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.teleport_to: method(x, y)
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.enable_movement: method()
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.reset_skills: method()
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.add_loyalty_effect: method(String loyalty_effect)
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.disable_movement: method()
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.set_character_unique: method(bool is_unique)
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.add_experience: method(experience_points, gravitas_points)
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.walk_to: method(x, y)
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_CHARACTER_SCRIPT_INTERFACE.attack: method( query_character_script_interface_target )
-- MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.add_scripted_permission: method(String scripted_permission_key)
--# assume MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.remove_scripted_permission: method(String scripted_permission_key)
--# assume MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.add_ceo: method(String ceo_data_key)
--# assume MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.apply_trigger: method(String trigger_key)
--# assume MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.query_character_ceo_management: method() --> QUERY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE
--# assume MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.remove_ceos: method(String ceo_data_key)
--# assume MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.unequip_slot: method(QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACEQUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE * ceo_equipment_slot_interface)
--# assume MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.equip_ceo_in_slot: method(QUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACEQUERY_CEO_EQUIPMENT_SLOT_SCRIPT_INTERFACE * ceo_equipment_slot_interface, QUERY_CEO_SCRIPT_INTERFACEQUERY_CEO_SCRIPT_INTERFACE * ceo_interface)
--# assume MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_CHARACTER_CEO_MANAGEMENT_SCRIPT_INTERFACE.change_points_of_ceos: method(String ceo_data_key, int32 change_in_points)
-- QUERY_DIPLOMACY_NEGOTIATED_DEAL_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATED_DEAL_SCRIPT_INTERFACE.recipients: method() --> QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATED_DEAL_SCRIPT_INTERFACE.components: method() --> QUERY_DIPLOMACY_PROPOSED_COMPONENT_LIST_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATED_DEAL_SCRIPT_INTERFACE.deal: method() --> QUERY_DIPLOMACY_DEAL_SCRIPT_INTERFACE
--# assume QUERY_DIPLOMACY_NEGOTIATED_DEAL_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_DIPLOMACY_NEGOTIATED_DEAL_SCRIPT_INTERFACE.proposers: method() --> QUERY_DIPLOMACY_NEGOTIATION_PARTICIPANT_LIST_SCRIPT_INTERFACE
-- MODIFY_UNIT_SCRIPT_INTERFACE
--# assume MODIFY_UNIT_SCRIPT_INTERFACE.query_unit: method() --> QUERY_UNIT_SCRIPT_INTERFACE
--# assume MODIFY_UNIT_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume MODIFY_UNIT_SCRIPT_INTERFACE.model: method() --> MODIFY_MODEL_SCRIPT_INTERFACE
-- QUERY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE
--# assume QUERY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE.factions_that_have_undercover_network_points_or_change_per_turn: method() --> QUERY_FACTION_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE.undercover_characters: method() --> QUERY_UNDERCOVER_CHARACTER_LIST_SCRIPT_INTERFACE
--# assume QUERY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE.undercover_network_point_change_per_turn_for_faction: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE * faction) --> number
--# assume QUERY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE.is_null_interface: method() --> boolean
--# assume QUERY_FACTION_UNDERCOVER_CHARACTER_MANAGER_SCRIPT_INTERFACE.undercover_network_points_for_faction: method(QUERY_FACTION_SCRIPT_INTERFACEQUERY_FACTION_SCRIPT_INTERFACE * faction) --> number
]]