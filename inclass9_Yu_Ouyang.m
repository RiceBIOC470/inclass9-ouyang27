% Inclass assignment 9

% The accession number for human NOTCH1 mRNA is AF308602
% 1. Read the information from this entry into matlab
accession = 'AF308602';
gb_data = getgenbank(accession);

% 2. Write code that runs a blast query on the first 500 base pairs of this
% gene against the refseq_rna database
seq_begin = gb_data.Sequence(1:500);
[requestID, requestTime] = blastncbi(seq_begin, 'blastn', 'Database', 'refseq_rna');
blast_data = getblast(requestID, 'WaitTime', requestTime);

% 3. Find the three highest scoring hits from other species and identify
% the length of the alignment and fraction of matches/mismatches. 
blast_data.Hits(2).Name
blast_data.Hits(2).Length
blast_data.Hits(2).HSPs.Identities

blast_data.Hits(6).Name
blast_data.Hits(6).Length
blast_data.Hits(6).HSPs.Identities

blast_data.Hits(7).Name
blast_data.Hits(7).Length
blast_data.Hits(7).HSPs.Identities

% Yu Ouyang answer: Hits 1 is from human, so start from hits 2. Hits 2-5
% are from Pan troglodytes. Hits 2 has a length of 9309, and 497
% matches, with 99%. Hits 6 is from Rhinopithecus bieti, 7683bp long, and
% has 488 matches with 98%. Hits 7 is from Cerocebus atys, 8166bp long, and
% has 486 matches with 97%. 


% 4. Run the same query against the database est_human. Comment on the
% sequences that you find. 
%%
[requestID_est, requestTime_est] = blastncbi(seq_begin, 'blastn', 'Database', 'est_human');
blast_data2 = getblast(requestID_est, 'WaitTime', requestTime_est);

blast_data.Hits.Name
% Yu Ouyang's comment: All the alignments are homologs of this gene from
% human genome, No gene from other species in the database, so you will not
% find any homolog from other species. 