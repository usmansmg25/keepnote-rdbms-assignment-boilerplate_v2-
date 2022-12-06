package com.stackroute.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;
import java.util.stream.Stream;

import org.junit.BeforeClass;
import org.junit.Test;

public class RDBMSAutomationTestCase {

	@Test
	public void solutionFileExistsTest() {
		assertTrue("Solution File Does not exist", Files.exists(Paths.get("keep-note.sql")));
	}

	@Test
	public void solutionFileEmptyTest() throws IOException {
		assertTrue("Solution File Does not exist", Files.exists(Paths.get("keep-note.sql")));
		long lines = Files.lines(Paths.get("keep-note.sql")).filter(s -> !s.isEmpty()).count();
		assertFalse("Solution File is Empty",lines == 0);
	}

}
